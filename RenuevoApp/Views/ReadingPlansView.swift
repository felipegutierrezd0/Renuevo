import SwiftUI

struct ReadingPlansView: View {
    @ObservedObject private var store = DataStore.shared

    var body: some View {
        List(ReadingPlanLibrary.all) { plan in
            NavigationLink {
                ReadingPlanDetailView(plan: plan)
            } label: {
                ReadingPlanRow(plan: plan, progress: store.progress(forPlan: plan.id))
            }
        }
        .navigationTitle("Planes de lectura")
    }
}

private struct ReadingPlanRow: View {
    let plan: ReadingPlan
    let progress: ReadingPlanProgress

    private var fraction: Double {
        Double(progress.completedDayIDs.count) / Double(plan.days.count)
    }

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: plan.icon)
                .font(.title2)
                .foregroundStyle(Color.renuevoAccent)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(plan.title).font(.headline)
                Text(plan.subtitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)

                if progress.completedDayIDs.isEmpty {
                    Text("Sin empezar · \(plan.days.count) días")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } else if progress.completedDayIDs.count == plan.days.count {
                    Label("Completado", systemImage: "checkmark.seal.fill")
                        .font(.caption.bold())
                        .foregroundStyle(.green)
                } else {
                    ProgressView(value: fraction)
                        .tint(Color.renuevoAccent)
                    Text("\(progress.completedDayIDs.count) de \(plan.days.count) días")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

struct ReadingPlanDetailView: View {
    let plan: ReadingPlan
    @ObservedObject private var store = DataStore.shared
    @State private var selectedDay: ReadingPlanDay?

    private var progress: ReadingPlanProgress { store.progress(forPlan: plan.id) }

    var body: some View {
        List {
            Section {
                Text(plan.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Section("Días") {
                ForEach(plan.days) { day in
                    Button {
                        selectedDay = day
                    } label: {
                        HStack {
                            Image(systemName: progress.isCompleted(day: day.id) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(progress.isCompleted(day: day.id) ? .green : .secondary)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Día \(day.id): \(day.title)")
                                    .foregroundStyle(.primary)
                                Text(day.passageReference)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle(plan.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedDay) { day in
            NavigationStack {
                ReadingPlanDayView(plan: plan, day: day)
            }
        }
    }
}

private struct ReadingPlanDayView: View {
    let plan: ReadingPlan
    let day: ReadingPlanDay
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var store = DataStore.shared
    @StateObject private var speech = SpeechReader()
    @State private var responseText: String
    @State private var justEarnedPoints: Int?

    init(plan: ReadingPlan, day: ReadingPlanDay) {
        self.plan = plan
        self.day = day
        _responseText = State(initialValue: DataStore.shared.progress(forPlan: plan.id).response(forDay: day.id))
    }

    private var isCompleted: Bool {
        store.progress(forPlan: plan.id).isCompleted(day: day.id)
    }

    private var pointsForCompleting: Int {
        responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? Points.readingDayCompleted
            : Points.readingDayCompleted + Points.readingDayResponseBonus
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text("Día \(day.id) · \(day.title)")
                    .font(.title3.bold())

                VStack(alignment: .leading, spacing: 8) {
                    Text(day.passage)
                        .font(.title3.weight(.medium))
                        .italic()
                    Text(day.passageReference)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.renuevoBackground)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                SpeechButton(speech: speech, text: day.spokenScript)

                Section {
                    Text(day.reflection)
                } header: {
                    Label("Reflexión", systemImage: "text.book.closed").font(.headline)
                }

                Section {
                    Text(day.action).fontWeight(.medium)
                } header: {
                    Label("Acción de hoy", systemImage: "checkmark.circle").font(.headline)
                }

                Section {
                    TextEditor(text: $responseText)
                        .frame(minHeight: 120)
                        .disabled(isCompleted)
                        .padding(8)
                        .background(Color.renuevoBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } header: {
                    Label("Escribe tu respuesta", systemImage: "pencil.and.scribble").font(.headline)
                } footer: {
                    Text("Escribe aquí mismo lo que Dios te habló hoy o cómo aplicaste la acción — suma puntos extra.")
                }

                if let justEarnedPoints {
                    Label("¡Ganaste \(justEarnedPoints) puntos!", systemImage: "sparkles")
                        .font(.subheadline.bold())
                        .foregroundStyle(.green)
                        .frame(maxWidth: .infinity, alignment: .center)
                }

                Button {
                    let earned = store.markReadingDayCompleted(planId: plan.id, day: day.id, response: responseText)
                    if earned > 0 {
                        justEarnedPoints = earned
                    } else {
                        dismiss()
                    }
                } label: {
                    Label(
                        isCompleted ? "Ya completado" : "Marcar como completado (+\(pointsForCompleting) puntos)",
                        systemImage: "checkmark"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.renuevoAccent)
                .disabled(isCompleted)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cerrar") { dismiss() }
            }
        }
    }
}

#Preview {
    NavigationStack { ReadingPlansView() }
}
