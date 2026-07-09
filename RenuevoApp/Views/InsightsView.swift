import SwiftUI
import Charts

struct InsightsView: View {
    @ObservedObject private var store = DataStore.shared

    private enum ProgressMode: String, CaseIterable {
        case resumen = "Resumen"
        case hoy = "Hoy"
    }

    @State private var mode: ProgressMode = .resumen

    private struct MoodPoint: Identifiable {
        let id: UUID
        let date: Date
        let valence: Int
    }

    private var recentMoodPoints: [MoodPoint] {
        store.entries
            .sorted { $0.date < $1.date }
            .suffix(14)
            .compactMap { entry in
                guard let option = MoodOption(rawValue: entry.mood) else { return nil }
                return MoodPoint(id: entry.id, date: entry.date, valence: option.valence)
            }
    }

    var body: some View {
        List {
            switch mode {
            case .resumen: resumenContent
            case .hoy: todayContent
            }
        }
        .navigationTitle("Crecimiento")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("Vista", selection: $mode) {
                    ForEach(ProgressMode.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(.segmented)
                .frame(width: 200)
            }
        }
    }

    @ViewBuilder
    private var resumenContent: some View {
        Section {
            HStack(spacing: 20) {
                StatTile(title: "Racha", value: "\(store.currentStreak)", subtitle: "días seguidos", systemImage: "flame.fill", tint: .orange)
                StatTile(title: "Metas", value: "\(Int(store.goalCompletionRate * 100))%", subtitle: "completadas", systemImage: "target", tint: .green)
                StatTile(title: "Hábitos hoy", value: "\(Int(store.todayHabitCompletionRate * 100))%", subtitle: "hechos", systemImage: "repeat.circle.fill", tint: Color.renuevoAccent)
            }
            .padding(.vertical, 6)
        }

        if recentMoodPoints.count >= 2 {
            Section("Tu ánimo (últimas entradas)") {
                Chart(recentMoodPoints) { point in
                    LineMark(x: .value("Fecha", point.date), y: .value("Ánimo", point.valence))
                        .foregroundStyle(Color.renuevoAccent)
                        .interpolationMethod(.catmullRom)
                    PointMark(x: .value("Fecha", point.date), y: .value("Ánimo", point.valence))
                        .foregroundStyle(Color.renuevoAccent)
                }
                .chartYScale(domain: 1...5)
                .chartYAxis {
                    AxisMarks(values: [1, 2, 3, 4, 5]) { _ in
                        AxisGridLine()
                    }
                }
                .frame(height: 160)
                .padding(.vertical, 4)
            }
        } else {
            Section {
                Text("Escribe algunas entradas más en tu diario para ver la tendencia de tu ánimo aquí.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }

        Section("Explora") {
            NavigationLink {
                ReadingPlansView()
            } label: {
                Label("Planes de lectura", systemImage: "book.pages.fill")
            }
            NavigationLink {
                MemorizationView()
            } label: {
                Label("Memorización de versículos", systemImage: "rectangle.stack.fill")
            }
            NavigationLink {
                BreathingView()
            } label: {
                Label("Ejercicio de respiración", systemImage: "wind")
            }
        }
    }

    @ViewBuilder
    private var todayContent: some View {
        let activeHabits = store.habits.filter { !$0.isArchived }

        Section {
            Text(Date(), style: .date)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }

        Section("Hábitos de hoy") {
            if activeHabits.isEmpty {
                Text("Aún no tienes hábitos. Créalos desde la pestaña Metas.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(activeHabits) { habit in
                    Button {
                        store.toggleHabitToday(habit)
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: habit.isCompleted() ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(habit.isCompleted() ? .green : .secondary)
                                .font(.title3)
                            Image(systemName: habit.icon)
                                .foregroundStyle(Color.renuevoAccent)
                                .frame(width: 20)
                            Text(habit.title)
                                .foregroundStyle(habit.isCompleted() ? .secondary : .primary)
                            Spacer()
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }

        Section("Metas") {
            if store.goals.isEmpty {
                Text("Aún no tienes metas. Créalas desde la pestaña Metas.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(store.goals) { goal in
                    Button {
                        store.toggleGoalCompletion(goal)
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(goal.isCompleted ? .green : .secondary)
                                .font(.title3)
                            Text(goal.title)
                                .strikethrough(goal.isCompleted)
                                .foregroundStyle(goal.isCompleted ? .secondary : .primary)
                            Spacer()
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

private struct StatTile: View {
    let title: String
    let value: String
    let subtitle: String
    let systemImage: String
    let tint: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: systemImage)
                .foregroundStyle(tint)
            Text(value)
                .font(.title3.bold())
            Text(subtitle)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack { InsightsView() }
}
