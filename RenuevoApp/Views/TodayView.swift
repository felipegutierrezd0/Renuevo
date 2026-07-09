import SwiftUI

struct TodayView: View {
    @State private var showingSettings = false
    @State private var showingBreathing = false
    @StateObject private var speech = SpeechReader()
    @ObservedObject private var store = DataStore.shared
    private var quote: Quote { QuoteLibrary.quote(for: Date()) }
    private var seasonal: SeasonalCollection? { SeasonalLibrary.active() }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 96)
                        .frame(maxWidth: .infinity)
                        .accessibilityLabel("Renuevo")

                    HStack {
                        Text(Date(), style: .date)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        if store.currentStreak > 0 {
                            Label("\(store.currentStreak)", systemImage: "flame.fill")
                                .font(.caption.bold())
                                .foregroundStyle(.orange)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Color.orange.opacity(0.12))
                                .clipShape(Capsule())
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)

                    if let seasonal {
                        NavigationLink {
                            SeasonalDetailView(collection: seasonal)
                        } label: {
                            HStack {
                                Image(systemName: seasonal.symbol)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(seasonal.title).font(.subheadline.bold())
                                    Text(seasonal.subtitle).font(.caption)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(12)
                            .background(Color.renuevoAccent.opacity(0.12))
                            .foregroundStyle(Color.renuevoAccent)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                    }

                    VStack(alignment: .leading, spacing: 16) {
                        Label(quote.category.rawValue, systemImage: quote.category.symbol)
                            .font(.caption.bold())
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(quote.category.tint.opacity(0.15))
                            .foregroundStyle(quote.category.tint)
                            .clipShape(Capsule())

                        Text(quote.text)
                            .font(.title2.weight(.semibold))
                            .fixedSize(horizontal: false, vertical: true)

                        Text(quote.reference)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.renuevoBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    HStack(spacing: 24) {
                        ShareButton(quote: quote)

                        SpeechButton(speech: speech, text: quote.spokenScript)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)

                    Divider().padding(.vertical, 4)

                    TodaySection(title: "Reflexión de hoy", systemImage: "text.book.closed") {
                        Text(quote.reflection)
                    }

                    TodaySection(title: "Enseñanza práctica", systemImage: "lightbulb") {
                        Text(quote.practicalTeaching)
                            .fontWeight(.medium)
                    }

                    TodaySection(title: "Pregunta para reflexionar", systemImage: "questionmark.circle") {
                        Text(quote.question)
                    }

                    TodaySection(title: "Acción concreta para hoy", systemImage: "checkmark.circle") {
                        Text(quote.action)
                    }

                    TodaySection(title: "Oración", systemImage: "hands.sparkles") {
                        Text(quote.prayer)
                            .italic()
                    }

                    Button {
                        showingBreathing = true
                    } label: {
                        Label("Hacer un ejercicio de respiración", systemImage: "wind")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(Color.renuevoAccent)
                }
                .padding()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                NotificationSettingsView()
            }
            .sheet(isPresented: $showingBreathing) {
                NavigationStack { BreathingView() }
            }
        }
    }
}

/// Clean, icon-only circular button used for the daily-message actions
/// (share message, listen, share story). The Label's text is kept for
/// VoiceOver but hidden visually via `.iconOnly`.
struct CircularIconButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .labelStyle(.iconOnly)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(Color.renuevoAccent)
            .frame(width: 54, height: 54)
            .background(Color.renuevoAccent.opacity(0.12), in: Circle())
            .overlay(
                Circle().strokeBorder(Color.renuevoAccent.opacity(0.18), lineWidth: 1)
            )
            .contentShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.92 : 1)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SeasonalDetailView: View {
    let collection: SeasonalCollection
    @StateObject private var speech = SpeechReader()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(collection.quotes) { quote in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(quote.text)
                            .font(.title3.weight(.semibold))
                        Text(quote.reference)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(quote.reflection)
                            .font(.subheadline)
                        SpeechButton(speech: speech, text: quote.spokenScript)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.renuevoBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding()
        }
        .navigationTitle(collection.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct TodaySection<Content: View>: View {
    let title: String
    let systemImage: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundStyle(Color.renuevoAccent)
            content
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NotificationSettingsView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                ReminderSection(
                    kind: .dailyMessage,
                    title: "Mensaje del día",
                    description: "El mensaje de fe o motivación de hoy."
                )
                ReminderSection(
                    kind: .morningJournal,
                    title: "Pregunta de la mañana",
                    description: "La pregunta del mensaje de hoy, para ponerla en práctica durante el día."
                )
                ReminderSection(
                    kind: .eveningJournal,
                    title: "Reflexión de la noche",
                    description: "Aprendizajes del día, qué hiciste bien y qué mejorar."
                )

                ICloudSyncSection()
            }
            .navigationTitle("Notificaciones")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Listo") { dismiss() }
                }
            }
        }
    }
}

private struct ICloudSyncSection: View {
    @State private var isEnabled = CloudSyncManager.shared.isEnabled

    var body: some View {
        Section {
            Toggle("Sincronizar con iCloud", isOn: $isEnabled)
                .onChange(of: isEnabled) { newValue in
                    CloudSyncManager.shared.isEnabled = newValue
                }
        } header: {
            Text("iCloud")
        } footer: {
            Text("Opcional. Lleva metas, diario, hábitos y peticiones de oración a tus otros dispositivos con la misma cuenta de iCloud. Apagado por defecto: por diseño, todo se queda en tu teléfono a menos que lo actives.")
        }
    }
}

private struct ReminderSection: View {
    let kind: ReminderKind
    let title: String
    let description: String

    @State private var isEnabled: Bool
    @State private var time: Date

    init(kind: ReminderKind, title: String, description: String) {
        self.kind = kind
        self.title = title
        self.description = description
        _isEnabled = State(initialValue: NotificationManager.shared.isEnabled(for: kind))
        var components = DateComponents()
        components.hour = NotificationManager.shared.hour(for: kind)
        components.minute = NotificationManager.shared.minute(for: kind)
        _time = State(initialValue: Calendar.current.date(from: components) ?? Date())
    }

    var body: some View {
        Section {
            Toggle(title, isOn: $isEnabled)
                .onChange(of: isEnabled) { newValue in
                    NotificationManager.shared.setEnabled(newValue, for: kind)
                }
            if isEnabled {
                DatePicker("Hora", selection: $time, displayedComponents: .hourAndMinute)
                    .onChange(of: time) { newValue in
                        let components = Calendar.current.dateComponents([.hour, .minute], from: newValue)
                        NotificationManager.shared.setHour(components.hour ?? kind.defaultHour, for: kind)
                        NotificationManager.shared.setMinute(components.minute ?? kind.defaultMinute, for: kind)
                    }
            }
        } footer: {
            Text(description)
        }
    }
}

#Preview {
    TodayView()
}
