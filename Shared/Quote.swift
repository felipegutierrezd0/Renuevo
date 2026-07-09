import Foundation

enum QuoteCategory: String, Codable, CaseIterable {
    case fe = "Fe"
    case superacion = "Superación"
    case crecimiento = "Crecimiento"
    case gratitud = "Gratitud"

    var symbol: String {
        switch self {
        case .fe: return "hands.sparkles.fill"
        case .superacion: return "flame.fill"
        case .crecimiento: return "leaf.fill"
        case .gratitud: return "heart.fill"
        }
    }
}

struct Quote: Identifiable, Codable, Hashable {
    let id: Int
    let text: String
    let reference: String
    let category: QuoteCategory
    /// A 2-3 minute reflection expanding on the verse/phrase.
    let reflection: String
    /// A one-line practical teaching distilled from the reflection.
    let practicalTeaching: String
    /// A question to journal about, specific to this quote.
    let question: String
    /// A concrete, doable action for today.
    let action: String
    /// A short prayer tied to the theme.
    let prayer: String

    /// Full script for text-to-speech, with section titles announced so
    /// listening feels like a guided devotional rather than a wall of text.
    var spokenScript: String {
        [
            "\(category.rawValue).",
            text,
            "\(reference).",
            "Reflexión de hoy.",
            reflection,
            "Enseñanza práctica.",
            practicalTeaching,
            "Pregunta para reflexionar.",
            question,
            "Acción concreta para hoy.",
            action,
            "Oración.",
            prayer,
        ].joined(separator: " ")
    }
}
