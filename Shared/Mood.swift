import Foundation

enum MoodCategory: String, Codable, CaseIterable {
    case ansiedad
    case tristeza
    case miedo
    case soledad
    case enojo
    case cansancio
    case culpa
    case confusion
    case estres
    case alegria
    case gratitud
    case esperanza
    case general

    /// Keywords used to detect this mood in free text (accents already stripped, lowercase).
    var keywords: [String] {
        switch self {
        case .ansiedad:
            return ["ansioso", "ansiosa", "ansiedad", "nervioso", "nerviosa", "angustia", "angustiado", "angustiada", "inquieto", "inquieta"]
        case .tristeza:
            return ["triste", "tristeza", "deprimido", "deprimida", "llorar", "llorando", "desanimado", "desanimada", "vacio", "vacia"]
        case .miedo:
            return ["miedo", "temor", "asustado", "asustada", "aterrado", "aterrada", "panico"]
        case .soledad:
            return ["solo", "sola", "soledad", "aislado", "aislada", "abandonado", "abandonada", "nadie me entiende", "incomprendido", "incomprendida"]
        case .enojo:
            return ["enojado", "enojada", "enojo", "furioso", "furiosa", "rabia", "molesto", "molesta", "ira", "frustrado", "frustrada", "frustracion"]
        case .cansancio:
            return ["cansado", "cansada", "cansancio", "agotado", "agotada", "exhausto", "exhausta", "sin energia", "sin fuerzas"]
        case .culpa:
            return ["culpa", "culpable", "arrepentido", "arrepentida", "verguenza", "avergonzado", "avergonzada"]
        case .confusion:
            return ["confundido", "confundida", "confusion", "perdido", "perdida", "no se que hacer", "no se qu\u{e9} hacer", "indeciso", "indecisa"]
        case .estres:
            return ["estres", "estresado", "estresada", "abrumado", "abrumada", "agobiado", "agobiada", "presion", "sobrepasado", "sobrepasada"]
        case .alegria:
            return ["feliz", "felicidad", "alegre", "alegria", "contento", "contenta", "emocionado", "emocionada"]
        case .gratitud:
            return ["agradecido", "agradecida", "gratitud", "bendecido", "bendecida"]
        case .esperanza:
            return ["esperanzado", "esperanzada", "esperanza", "ilusionado", "ilusionada", "motivado", "motivada"]
        case .general:
            return []
        }
    }

    var symbol: String {
        switch self {
        case .ansiedad: return "wind"
        case .tristeza: return "cloud.rain"
        case .miedo: return "exclamationmark.shield"
        case .soledad: return "person"
        case .enojo: return "flame"
        case .cansancio: return "moon.zzz"
        case .culpa: return "arrow.uturn.backward"
        case .confusion: return "questionmark.diamond"
        case .estres: return "tornado"
        case .alegria: return "sun.max"
        case .gratitud: return "heart"
        case .esperanza: return "sparkles"
        case .general: return "hands.sparkles"
        }
    }
}

struct MoodResponse: Codable {
    let mood: MoodCategory
    let passage: String
    let passageReference: String
    let reflection: String
    let prayer: String
    let exercises: [String]
    let encouragement: String

    /// Full script for text-to-speech, with section titles announced.
    var spokenScript: String {
        [
            "Pasaje.",
            passage,
            "\(passageReference).",
            "Reflexión.",
            reflection,
            "Oración.",
            prayer,
            "Ejercicios para calmarte.",
            exercises.joined(separator: ". "),
            "Palabras de ánimo.",
            encouragement,
        ].joined(separator: " ")
    }
}
