import SwiftUI
import UIKit

/// Structural treatment of a share card — not just colors, the composition
/// itself changes between styles.
enum CardLayout {
    case classic
    case bigQuote
    case sideAccent
    case minimal
}

/// A color + layout combination a user can pick when sharing a quote as an
/// image. `QuoteCardStyle.all` is the full pool; `ShareStylePicker` samples 3
/// at random from it each time, never repeating the exact trio shown before.
struct QuoteCardStyle: Identifiable, Equatable {
    let id: Int
    let name: String
    let colors: [Color]
    let accent: Color
    let textColor: Color
    let layout: CardLayout

    static func == (lhs: QuoteCardStyle, rhs: QuoteCardStyle) -> Bool { lhs.id == rhs.id }

    static let all: [QuoteCardStyle] = [
        QuoteCardStyle(
            id: 0, name: "Esmeralda nocturna",
            colors: [
                Color(red: 0.11, green: 0.20, blue: 0.19),
                Color(red: 0.086, green: 0.169, blue: 0.165),
                Color(red: 0.051, green: 0.114, blue: 0.113),
                Color(red: 0.039, green: 0.09, blue: 0.09),
            ],
            accent: Color.renuevoTeal, textColor: .white, layout: .classic
        ),
        QuoteCardStyle(
            id: 1, name: "Atardecer cálido",
            colors: [
                Color(red: 0.55, green: 0.19, blue: 0.27),
                Color(red: 0.75, green: 0.35, blue: 0.24),
                Color(red: 0.87, green: 0.55, blue: 0.30),
            ],
            accent: Color(red: 1.0, green: 0.87, blue: 0.62), textColor: .white, layout: .bigQuote
        ),
        QuoteCardStyle(
            id: 2, name: "Aurora violeta",
            colors: [
                Color(red: 0.16, green: 0.09, blue: 0.32),
                Color(red: 0.32, green: 0.14, blue: 0.42),
                Color(red: 0.50, green: 0.22, blue: 0.45),
            ],
            accent: Color(red: 0.87, green: 0.74, blue: 1.0), textColor: .white, layout: .classic
        ),
        QuoteCardStyle(
            id: 3, name: "Papel claro",
            colors: [
                Color(red: 0.97, green: 0.95, blue: 0.90),
                Color(red: 0.94, green: 0.91, blue: 0.85),
            ],
            accent: Color(red: 0.55, green: 0.40, blue: 0.20),
            textColor: Color(red: 0.20, green: 0.16, blue: 0.12), layout: .minimal
        ),
        QuoteCardStyle(
            id: 4, name: "Océano profundo",
            colors: [
                Color(red: 0.04, green: 0.09, blue: 0.22),
                Color(red: 0.06, green: 0.16, blue: 0.34),
                Color(red: 0.08, green: 0.26, blue: 0.44),
            ],
            accent: Color(red: 0.55, green: 0.85, blue: 0.95), textColor: .white, layout: .sideAccent
        ),
        QuoteCardStyle(
            id: 5, name: "Terracota",
            colors: [
                Color(red: 0.32, green: 0.16, blue: 0.11),
                Color(red: 0.52, green: 0.27, blue: 0.15),
                Color(red: 0.66, green: 0.40, blue: 0.23),
            ],
            accent: Color(red: 1.0, green: 0.88, blue: 0.72), textColor: .white, layout: .minimal
        ),
    ]
}

/// A vertical (9:16) branded card for sharing the daily message as an
/// Instagram-Story-shaped image. `scale` lets the same view double as both a
/// cheap live SwiftUI thumbnail (small scale) and the source for the final
/// full-resolution PNG (scale 1).
struct ShareableQuoteCard: View {
    let quote: Quote
    let style: QuoteCardStyle
    var scale: CGFloat = 1

    private func s(_ value: CGFloat) -> CGFloat { value * scale }

    var body: some View {
        ZStack {
            background
            layoutBody
        }
        .frame(width: s(1080), height: s(1920))
        .clipped()
    }

    @ViewBuilder
    private var layoutBody: some View {
        switch style.layout {
        case .classic: classicLayout
        case .bigQuote: bigQuoteLayout
        case .sideAccent: sideAccentLayout
        case .minimal: minimalLayout
        }
    }

    private var background: some View {
        ZStack {
            LinearGradient(colors: style.colors, startPoint: .top, endPoint: .bottom)
            RadialGradient(colors: [style.accent.opacity(0.30), .clear], center: .top, startRadius: 0, endRadius: s(900))
        }
    }

    private var logo: some View {
        HStack(spacing: s(12)) {
            Image("SunMark")
                .resizable()
                .scaledToFit()
                .frame(width: s(44), height: s(44))
            Text("RENUEVO")
                .font(.system(size: s(26), weight: .bold))
                .tracking(s(4))
                .foregroundStyle(style.accent)
        }
    }

    private var footer: some View {
        Text("renuevo · fe y crecimiento personal")
            .font(.system(size: s(18)))
            .foregroundStyle(style.textColor.opacity(0.45))
    }

    // MARK: - Classic: logo top, badge + centered quote, footer bottom.

    private var classicLayout: some View {
        VStack(spacing: 0) {
            logo.padding(.top, s(120))
            Spacer(minLength: 0)
            VStack(spacing: s(28)) {
                Text(quote.category.rawValue.uppercased())
                    .font(.system(size: s(20), weight: .bold))
                    .tracking(s(3))
                    .padding(.horizontal, s(20))
                    .padding(.vertical, s(8))
                    .background(style.accent.opacity(0.18))
                    .foregroundStyle(style.accent)
                    .clipShape(Capsule())

                Text(quote.text)
                    .font(.system(size: s(52), weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(style.textColor)
                    .lineSpacing(s(6))

                Text(quote.reference)
                    .font(.system(size: s(26), weight: .medium))
                    .foregroundStyle(style.textColor.opacity(0.75))
            }
            .padding(.horizontal, s(64))
            Spacer(minLength: 0)
            footer.padding(.bottom, s(100))
        }
    }

    // MARK: - Big quote: giant quotation mark behind left-aligned text.

    private var bigQuoteLayout: some View {
        VStack(alignment: .leading, spacing: 0) {
            logo.padding(.top, s(120)).padding(.leading, s(64))
            Spacer(minLength: 0)
            ZStack(alignment: .topLeading) {
                Text("“")
                    .font(.system(size: s(260), weight: .black, design: .serif))
                    .foregroundStyle(style.accent.opacity(0.35))
                    .offset(x: s(-10), y: s(-90))

                VStack(alignment: .leading, spacing: s(24)) {
                    Text(quote.category.rawValue.uppercased())
                        .font(.system(size: s(18), weight: .bold))
                        .tracking(s(3))
                        .foregroundStyle(style.accent)

                    Text(quote.text)
                        .font(.system(size: s(48), weight: .bold, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(style.textColor)
                        .lineSpacing(s(6))

                    Text(quote.reference)
                        .font(.system(size: s(24), weight: .medium))
                        .foregroundStyle(style.textColor.opacity(0.8))
                }
                .padding(.top, s(70))
            }
            .padding(.horizontal, s(64))
            Spacer(minLength: 0)
            footer.padding(.leading, s(64)).padding(.bottom, s(100))
        }
    }

    // MARK: - Side accent: vertical bar + left-aligned text, logo top-right.

    private var sideAccentLayout: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                logo
            }
            .padding(.top, s(120))
            .padding(.horizontal, s(64))

            Spacer(minLength: 0)

            HStack(alignment: .top, spacing: s(24)) {
                RoundedRectangle(cornerRadius: s(4))
                    .fill(style.accent)
                    .frame(width: s(8))

                VStack(alignment: .leading, spacing: s(24)) {
                    Text(quote.category.rawValue.uppercased())
                        .font(.system(size: s(18), weight: .bold))
                        .tracking(s(3))
                        .foregroundStyle(style.accent)

                    Text(quote.text)
                        .font(.system(size: s(46), weight: .bold, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(style.textColor)
                        .lineSpacing(s(6))

                    Text(quote.reference)
                        .font(.system(size: s(24), weight: .medium))
                        .foregroundStyle(style.textColor.opacity(0.8))
                }
            }
            .padding(.horizontal, s(64))

            Spacer(minLength: 0)
            footer.padding(.bottom, s(100))
        }
    }

    // MARK: - Minimal: no badge/box, just refined centered typography + a rule.

    private var minimalLayout: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            VStack(spacing: s(32)) {
                Text(quote.text)
                    .font(.system(size: s(50), weight: .semibold, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(style.textColor)
                    .lineSpacing(s(8))

                Rectangle()
                    .fill(style.accent)
                    .frame(width: s(60), height: s(3))

                Text(quote.reference.uppercased())
                    .font(.system(size: s(22), weight: .medium))
                    .tracking(s(2))
                    .foregroundStyle(style.accent)
            }
            .padding(.horizontal, s(70))
            Spacer(minLength: 0)
            VStack(spacing: s(10)) {
                Image("SunMark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: s(32), height: s(32))
                Text("RENUEVO")
                    .font(.system(size: s(16), weight: .bold))
                    .tracking(s(3))
                    .foregroundStyle(style.textColor.opacity(0.6))
            }
            .padding(.bottom, s(100))
        }
    }
}

/// Renders `ShareableQuoteCard` off-screen to a PNG file, ready to hand to a
/// share sheet (Instagram Stories picks it up as a regular image attachment).
@MainActor
enum QuoteImageRenderer {
    static func renderPNG(for quote: Quote, style: QuoteCardStyle) -> URL? {
        let renderer = ImageRenderer(content: ShareableQuoteCard(quote: quote, style: style))
        renderer.scale = 1
        guard let uiImage = renderer.uiImage, let data = uiImage.pngData() else { return nil }
        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent("renuevo-story-\(quote.id)-\(style.id)-\(Int(Date().timeIntervalSince1970)).png")
        do {
            try data.write(to: url, options: .atomic)
            return url
        } catch {
            return nil
        }
    }
}

/// Thin wrapper around `UIActivityViewController` so we can share a file URL
/// (works reliably with every share target, including "Add to Instagram Story").
struct ActivityShareSheet: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ controller: UIActivityViewController, context: Context) {}
}

/// Picks 3 styles at random from the full pool, never repeating the exact
/// trio shown the previous time (persisted across launches).
enum ShareStyleSampler {
    private static let lastShownKey = "renuevo.lastShownCardStyleIDs"

    static func sampleThree() -> [QuoteCardStyle] {
        let previous = Set(UserDefaults.standard.array(forKey: lastShownKey) as? [Int] ?? [])
        var candidate = Array(QuoteCardStyle.all.shuffled().prefix(3))
        var attempts = 0
        while Set(candidate.map(\.id)) == previous && attempts < 5 {
            candidate = Array(QuoteCardStyle.all.shuffled().prefix(3))
            attempts += 1
        }
        UserDefaults.standard.set(candidate.map(\.id), forKey: lastShownKey)
        return candidate
    }
}

/// Identifiable wrapper so the iOS activity sheet can be driven by
/// `.sheet(item:)` — more reliable than presenting a second boolean sheet from
/// within an already-presented sheet (which can silently no-op due to timing).
private struct SharePayload: Identifiable {
    let id = UUID()
    let items: [Any]
}

/// The single "Compartir" button on the "Hoy" screen. Tapping it opens one
/// unified sheet offering both image and text ways to share the daily message.
struct ShareButton: View {
    let quote: Quote
    @State private var showingSheet = false

    var body: some View {
        Button {
            showingSheet = true
        } label: {
            Label("Compartir", systemImage: "square.and.arrow.up")
        }
        .buttonStyle(CircularIconButtonStyle())
        .sheet(isPresented: $showingSheet) {
            ShareSheetView(quote: quote)
        }
    }
}

/// Unified share sheet: an image section (3 live style previews, re-rollable,
/// each tappable to render + share a Story-shaped PNG) and a text section
/// (share the message as plain text or copy it to the clipboard).
struct ShareSheetView: View {
    let quote: Quote
    @Environment(\.dismiss) private var dismiss
    @State private var styles: [QuoteCardStyle] = []
    @State private var sharePayload: SharePayload?
    @State private var didCopy = false

    private var messageText: String { "\(quote.text) — \(quote.reference)" }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    imageSection
                    Divider()
                    textSection
                }
                .padding(.vertical, 24)
            }
            .navigationTitle("Compartir")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cerrar") { dismiss() }
                }
            }
        }
        .onAppear {
            if styles.isEmpty {
                styles = ShareStyleSampler.sampleThree()
            }
        }
        .sheet(item: $sharePayload) { payload in
            ActivityShareSheet(items: payload.items)
        }
    }

    // MARK: - Image section

    private var imageSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionHeader("Compartir como imagen", systemImage: "photo.badge.plus")

            Text("Toca un estilo para compartirlo. Cada vez te mostramos una combinación distinta.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            HStack(spacing: 14) {
                ForEach(styles) { style in
                    Button {
                        shareImage(with: style)
                    } label: {
                        VStack(spacing: 8) {
                            ShareableQuoteCard(quote: quote, style: style, scale: 0.10)
                                .frame(width: 1080 * 0.10, height: 1920 * 0.10)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                                )
                            Text(style.name)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(width: 1080 * 0.10)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)

            Button {
                styles = ShareStyleSampler.sampleThree()
            } label: {
                Label("Mostrar otros 3 estilos", systemImage: "arrow.triangle.2.circlepath")
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity)
        }
    }

    // MARK: - Text section

    private var textSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionHeader("Compartir como texto", systemImage: "text.quote")

            Text(messageText)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.renuevoBackground)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)

            VStack(spacing: 10) {
                Button {
                    sharePayload = SharePayload(items: [messageText])
                } label: {
                    Label("Compartir como texto", systemImage: "square.and.arrow.up")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.renuevoAccent)

                Button {
                    copyMessage()
                } label: {
                    Label(didCopy ? "¡Copiado!" : "Copiar mensaje",
                          systemImage: didCopy ? "checkmark" : "doc.on.doc")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(Color.renuevoAccent)
            }
            .padding(.horizontal)
        }
    }

    private func sectionHeader(_ title: String, systemImage: String) -> some View {
        Label(title, systemImage: systemImage)
            .font(.headline)
            .foregroundStyle(Color.renuevoAccent)
            .padding(.horizontal)
    }

    // MARK: - Actions

    private func shareImage(with style: QuoteCardStyle) {
        guard let url = QuoteImageRenderer.renderPNG(for: quote, style: style) else { return }
        sharePayload = SharePayload(items: [url])
    }

    private func copyMessage() {
        UIPasteboard.general.string = messageText
        withAnimation { didCopy = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation { didCopy = false }
        }
    }
}

#Preview {
    ShareableQuoteCard(quote: QuoteLibrary.all[0], style: QuoteCardStyle.all[0])
        .previewLayout(.fixed(width: 1080, height: 1920))
}
