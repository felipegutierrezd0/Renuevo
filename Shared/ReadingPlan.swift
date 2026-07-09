import Foundation

struct ReadingPlanDay: Identifiable, Codable, Hashable {
    var id: Int
    var title: String
    var passage: String
    var passageReference: String
    var reflection: String
    var action: String

    /// Full script for text-to-speech, with section titles announced.
    var spokenScript: String {
        [
            "Día \(id). \(title).",
            passage,
            "\(passageReference).",
            "Reflexión.",
            reflection,
            "Acción de hoy.",
            action,
        ].joined(separator: " ")
    }
}

struct ReadingPlan: Identifiable, Codable, Hashable {
    var id: String
    var title: String
    var subtitle: String
    var icon: String
    var days: [ReadingPlanDay]
}

/// Per-plan progress, keyed by `ReadingPlan.id`.
struct ReadingPlanProgress: Codable, Hashable {
    var planId: String
    var completedDayIDs: Set<Int> = []
    var startedAt: Date = Date()
    var lastCompletedAt: Date?

    func isCompleted(day: Int) -> Bool { completedDayIDs.contains(day) }

    /// The next day to read: the first day not yet completed, or nil if the plan is done.
    func nextDay(in plan: ReadingPlan) -> ReadingPlanDay? {
        plan.days.first { !completedDayIDs.contains($0.id) }
    }
}
