import Foundation

/// Shared UserDefaults key names, used by both the app (`DataStore`) and the
/// widget extension (which reads the same App Group container read-only).
enum StorageKeys {
    static let goals = "renuevo.goals.v1"
    static let entries = "renuevo.journal.v1"
    static let chatMessages = "renuevo.chat.v1"
    static let habits = "renuevo.habits.v1"
    static let prayerRequests = "renuevo.prayers.v1"
    static let readingProgress = "renuevo.readingProgress.v1"
    static let memorizationCards = "renuevo.memorization.v1"
    static let appOpenDayKeys = "renuevo.appOpenDayKeys.v1"
}
