import Foundation

struct Goal: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var title: String
    var notes: String = ""
    var targetDate: Date?
    var isCompleted: Bool = false
    var createdAt: Date = Date()

    // Reflexión guiada
    var whyImportant: String = ""
    var valueRepresented: String = ""
    var fearHoldingBack: String = ""
    var nextSmallStep: String = ""
    var spiritualInspiration: String = ""

    var hasGuidedReflection: Bool {
        !whyImportant.isEmpty || !valueRepresented.isEmpty || !fearHoldingBack.isEmpty
            || !nextSmallStep.isEmpty || !spiritualInspiration.isEmpty
    }
}
