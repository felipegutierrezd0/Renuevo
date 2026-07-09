import Foundation

enum AppGroup {
    static let id = "group.com.renuevo.app"

    /// Shared container so the widget extension can read what the app saves.
    /// Falls back to `.standard` if the group isn't available for some reason
    /// (e.g. entitlement misconfigured), so the app never crashes over this.
    static var defaults: UserDefaults {
        UserDefaults(suiteName: id) ?? .standard
    }
}
