import WidgetKit
import SwiftUI

struct GoalsEntry: TimelineEntry {
    let date: Date
    let goals: [Goal]
    let habits: [Habit]
}

struct GoalsProvider: TimelineProvider {
    func placeholder(in context: Context) -> GoalsEntry {
        GoalsEntry(date: Date(), goals: [], habits: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (GoalsEntry) -> Void) {
        completion(currentEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<GoalsEntry>) -> Void) {
        let entry = currentEntry()
        // The app also calls WidgetCenter.reloadAllTimelines() on every change,
        // but this makes sure "today" rolls over even if the app never opens.
        let midnight = Calendar.current.nextDate(
            after: Date(), matching: DateComponents(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime
        ) ?? Date().addingDays(1)
        completion(Timeline(entries: [entry], policy: .after(midnight)))
    }

    private func currentEntry() -> GoalsEntry {
        let goals: [Goal] = load(StorageKeys.goals) ?? []
        let habits: [Habit] = load(StorageKeys.habits) ?? []
        return GoalsEntry(date: Date(), goals: goals, habits: habits)
    }

    private func load<T: Decodable>(_ key: String) -> T? {
        guard let data = AppGroup.defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

struct GoalsWidgetView: View {
    @Environment(\.widgetFamily) private var family
    let entry: GoalsEntry

    private var activeHabits: [Habit] { entry.habits.filter { !$0.isArchived } }
    private var habitsDone: Int { activeHabits.filter { $0.isCompleted(on: entry.date) }.count }
    private var pendingGoals: [Goal] { entry.goals.filter { !$0.isCompleted } }

    var body: some View {
        switch family {
        case .systemSmall:
            TodaySummaryView(habitsDone: habitsDone, habitsTotal: activeHabits.count, goalsTotal: entry.goals.count)
        default:
            AllProgressView(goals: entry.goals, habits: activeHabits, date: entry.date, showsHabits: family == .systemLarge)
        }
    }
}

/// Small widget: "today" snapshot — how many habits are done today.
private struct TodaySummaryView: View {
    let habitsDone: Int
    let habitsTotal: Int
    let goalsTotal: Int

    private var fraction: Double {
        habitsTotal == 0 ? 0 : Double(habitsDone) / Double(habitsTotal)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 5) {
                Image(systemName: "target")
                    .font(.caption2.bold())
                Text("Hoy")
                    .font(.caption2.bold())
            }
            .foregroundStyle(Color.renuevoAccent)

            Spacer(minLength: 0)

            ZStack {
                Circle()
                    .stroke(Color.renuevoAccent.opacity(0.15), lineWidth: 7)
                Circle()
                    .trim(from: 0, to: fraction)
                    .stroke(Color.renuevoAccent, style: StrokeStyle(lineWidth: 7, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                VStack(spacing: 0) {
                    Text("\(habitsDone)/\(habitsTotal)")
                        .font(.system(.callout, design: .rounded).bold())
                    Text("hábitos")
                        .font(.system(size: 9))
                        .foregroundStyle(.secondary)
                }
            }
            .frame(width: 64, height: 64)

            Spacer(minLength: 0)

            Text("\(goalsTotal) meta\(goalsTotal == 1 ? "" : "s") activa\(goalsTotal == 1 ? "" : "s")")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .widgetBackground(Color.renuevoBackground)
    }
}

/// Medium/large widget: all goals (and, on large, habits) together.
private struct AllProgressView: View {
    let goals: [Goal]
    let habits: [Habit]
    let date: Date
    let showsHabits: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 5) {
                Image(systemName: "target")
                Text("Metas")
                    .font(.headline)
            }
            .foregroundStyle(Color.renuevoAccent)

            if goals.isEmpty {
                Text("Aún no tienes metas.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(goals.prefix(showsHabits ? 3 : 4)) { goal in
                    HStack(spacing: 6) {
                        Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(goal.isCompleted ? .green : .secondary)
                        Text(goal.title)
                            .font(.caption)
                            .strikethrough(goal.isCompleted)
                            .foregroundStyle(goal.isCompleted ? .secondary : .primary)
                            .lineLimit(1)
                    }
                }
            }

            if showsHabits {
                Divider().padding(.vertical, 2)
                HStack(spacing: 5) {
                    Image(systemName: "repeat")
                    Text("Hábitos de hoy")
                        .font(.headline)
                }
                .foregroundStyle(Color.renuevoAccent)

                if habits.isEmpty {
                    Text("Aún no tienes hábitos.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(habits.prefix(4)) { habit in
                        HStack(spacing: 6) {
                            Image(systemName: habit.isCompleted(on: date) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(habit.isCompleted(on: date) ? .green : .secondary)
                            Text(habit.title)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                }
            }

            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .widgetBackground(Color.renuevoBackground)
    }
}

struct GoalsWidget: Widget {
    let kind: String = "GoalsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: GoalsProvider()) { entry in
            GoalsWidgetView(entry: entry)
        }
        .configurationDisplayName("Progreso de metas y hábitos")
        .description("Pequeño: tu avance de hoy. Mediano/grande: todas tus metas y hábitos juntos.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
