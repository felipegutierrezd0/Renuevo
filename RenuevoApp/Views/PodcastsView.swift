import SwiftUI

struct Podcast: Identifiable {
    let id = UUID()
    let title: String
    let host: String
    let description: String
    let imageURL: URL
    let showURL: URL
}

enum PodcastLibrary {
    static let all: [Podcast] = [
        Podcast(
            title: "Mujeres a la Mesa",
            host: "Michelle Londoño",
            description: "Un espacio íntimo donde las conversaciones nacen del corazón: maternidad, fe, emprendimiento y propósito. Un recordatorio de que no estás sola y de que Dios tiene un plan perfecto.",
            imageURL: URL(string: "https://i.scdn.co/image/ab6765630000ba8a2fc2fe0751eadc3b7a5c3935")!,
            showURL: URL(string: "https://open.spotify.com/show/4MeV4SGA4xSf3CUbmjlfZe")!
        ),
    ]
}

struct PodcastsView: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        List {
            Section {
                ForEach(PodcastLibrary.all) { podcast in
                    Button {
                        openURL(podcast.showURL)
                    } label: {
                        PodcastRow(podcast: podcast)
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("Recomendados para ti")
            } footer: {
                Text("Se abre en la app de Spotify si la tienes instalada, o en el navegador.")
            }
        }
        .navigationTitle("Podcasts")
    }
}

private struct PodcastRow: View {
    let podcast: Podcast

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            AsyncImage(url: podcast.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure:
                    Image(systemName: "mic.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(24)
                        .foregroundStyle(.secondary)
                default:
                    ProgressView()
                }
            }
            .frame(width: 88, height: 88)
            .background(Color.renuevoBackground)
            .clipShape(RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 5) {
                Text(podcast.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(podcast.host)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(podcast.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                Label("Escuchar en Spotify", systemImage: "arrow.up.right")
                    .font(.caption.bold())
                    .foregroundStyle(Color.renuevoAccent)
                    .padding(.top, 2)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack { PodcastsView() }
}
