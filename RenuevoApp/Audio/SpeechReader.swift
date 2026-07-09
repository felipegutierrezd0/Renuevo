import Foundation
import AVFoundation
import SwiftUI

/// Thin wrapper around `AVSpeechSynthesizer` so any view can offer a "listen"
/// button for a reflection or prayer, entirely on-device (no network, no account).
final class SpeechReader: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    @Published var isSpeaking = false

    private let synthesizer = AVSpeechSynthesizer()

    override init() {
        super.init()
        synthesizer.delegate = self
    }

    func toggle(_ text: String) {
        if isSpeaking {
            stop()
        } else {
            speak(text)
        }
    }

    func speak(_ text: String) {
        let cleaned = Self.naturalizePunctuation(text)
        guard !cleaned.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio, options: [.duckOthers])
        try? AVAudioSession.sharedInstance().setActive(true, options: [])

        let utterance = AVSpeechUtterance(string: cleaned)
        utterance.voice = Self.bestLatinSpanishVoice()
        // Slightly slower and a touch brighter than default: warmer and easier
        // to savor for devotional content, without dragging or sounding flat.
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate * 0.9
        utterance.pitchMultiplier = 1.04
        utterance.postUtteranceDelay = 0.05
        synthesizer.speak(utterance)
        isSpeaking = true
    }

    /// Picks the best-sounding installed Latin American Spanish voice. Prefers a
    /// short list of voices known for sounding warm and expressive (over the
    /// flatter default compact voices), then falls back to the highest quality
    /// tier available (Siri/enhanced voices sound far more natural than the
    /// robotic default), then to neutral Latin American, Spain Spanish, and
    /// finally any Spanish voice at all — so this never returns nil in practice.
    private static func bestLatinSpanishVoice() -> AVSpeechSynthesisVoice? {
        let allVoices = AVSpeechSynthesisVoice.speechVoices()
        let preferredLanguages = ["es-MX", "es-US", "es-419", "es-CO", "es-AR", "es-ES"]
        let warmVoiceNames = ["paulina", "mónica", "monica", "angélica", "angelica", "isabela", "marisol"]

        // Named voices are checked regardless of quality tier: on most devices
        // nobody has manually downloaded the "enhanced" voice packs, so
        // requiring enhanced/premium here would skip Paulina/Mónica entirely
        // and fall through to a novelty voice like "Eddy" or "Grandpa".
        for language in preferredLanguages {
            let candidates = allVoices.filter { $0.language == language }
            if let warm = candidates.first(where: { candidate in
                warmVoiceNames.contains(where: { candidate.name.lowercased().contains($0) })
            }) {
                return warm
            }
        }
        for language in preferredLanguages {
            let candidates = allVoices.filter { $0.language == language }
            if let premium = candidates.first(where: { $0.quality == .premium }) { return premium }
            if let enhanced = candidates.first(where: { $0.quality == .enhanced }) { return enhanced }
        }
        for language in preferredLanguages {
            if let any = allVoices.first(where: { $0.language == language }) { return any }
        }
        return AVSpeechSynthesisVoice(language: "es-MX")
    }

    /// Adds/normalizes punctuation between concatenated sentence fragments so the
    /// synthesizer takes natural pauses instead of running everything together.
    private static func naturalizePunctuation(_ text: String) -> String {
        var result = text.trimmingCharacters(in: .whitespacesAndNewlines)
        // Collapse "sentence. . next" artifacts from joining fragments that already end in a period.
        while result.contains("..") {
            result = result.replacingOccurrences(of: "..", with: ".")
        }
        if let last = result.last, !".?!…".contains(last) {
            result += "."
        }
        return result
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        isSpeaking = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        DispatchQueue.main.async { self.isSpeaking = false }
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        DispatchQueue.main.async { self.isSpeaking = false }
    }
}

/// A small "Escuchar" / "Detener" button that reads `text` aloud on-device.
struct SpeechButton: View {
    @ObservedObject var speech: SpeechReader
    let text: String

    var body: some View {
        Button {
            speech.toggle(text)
        } label: {
            Label(speech.isSpeaking ? "Detener" : "Escuchar", systemImage: speech.isSpeaking ? "stop.fill" : "speaker.wave.2.fill")
        }
        .buttonStyle(.bordered)
    }
}
