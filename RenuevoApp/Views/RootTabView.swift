import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem { Label("Hoy", systemImage: "sun.max.fill") }

            MetasView()
                .tabItem { Label("Metas", systemImage: "target") }

            DiarioView()
                .tabItem { Label("Diario", systemImage: "book.closed.fill") }

            NavigationStack { InsightsView() }
                .tabItem { Label("Crecimiento", systemImage: "chart.line.uptrend.xyaxis") }

            NavigationStack { PodcastsView() }
                .tabItem { Label("Podcasts", systemImage: "mic.fill") }

            ChatView()
                .tabItem { Label("Chat", systemImage: "bubble.left.and.text.bubble.right.fill") }
        }
        .tint(.renuevoAccent)
    }
}

#Preview {
    RootTabView()
}
