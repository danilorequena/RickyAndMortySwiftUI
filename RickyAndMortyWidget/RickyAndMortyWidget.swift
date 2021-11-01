//
//  RickyAndMortyWidget.swift
//  RickyAndMortyWidget
//
//  Created by Danilo Requena on 11/10/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    typealias Entry = RickyAndMortyEntry
    
    func placeholder(in context: Context) -> RickyAndMortyEntry {
        RickyAndMortyEntry.placeholder
    }
    
    func getSnapshot(in context: Context, completion: @escaping (RickyAndMortyEntry) -> Void) {
        if context.isPreview {
            completion(RickyAndMortyEntry.placeholder)
        } else {
            fetchCharacters { (result) in
                switch result {
                case .success(let entry):
                    completion(entry)
                case .failure(_):
                    completion(RickyAndMortyEntry.placeholder)
                }
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<RickyAndMortyEntry>) -> Void) {
        fetchCharacters { (result) in
            switch result {
            case .success(let entry):
                let timeline  = Timeline(entries: [entry], policy: .after(Date()))
                completion(timeline)
            case .failure:
                let timeline = Timeline(entries: [RickyAndMortyEntry.placeholder], policy: .after(Date()))
                completion(timeline)
            }
        }
    }
    
    private func fetchCharacters(completion: @escaping(Result<RickyAndMortyEntry, APIServiceError>) -> Void) {
        CharactersService.loadCharacters(page: "1") {(result: Result<CharactersModel, APIServiceError>) in
            switch result {
            case .success(let results):
                let characters = RickyAndMortyEntry(
                    date: Date(),
                    characters: results
                )
                completion(.success(characters))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}

struct RickyAndMortyEntry: TimelineEntry, Codable {
    var date: Date
    var characters: CharactersModel
    var isPlaceholder = false
}

struct RickyAndMortyWidgetEntryView : View {
    var entry: RickyAndMortyEntry
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .systemMedium:
            HStack {
                Text(entry.characters.results.first?.name ?? "")
            }
        default:
            HStack {
                Text(entry.characters.results.first?.name ?? "")
            }
        }
    }
}

@main
struct RickyAndMortyWidget: Widget {
    let kind: String = "RickyAndMortyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            RickyAndMortyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct RickyAndMortyWidget_Previews: PreviewProvider {
    static var previews: some View {
        RickyAndMortyWidgetEntryView(entry: RickyAndMortyEntry.stub)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

extension RickyAndMortyEntry {
    static var stub: RickyAndMortyEntry {
        RickyAndMortyEntry(
            date: Date(),
            characters: .init(results: [
                CharactersResults(
                    id: 0,
                    name: "Lois Lane",
                    status: "",
                    species: "",
                    gender: "",
                    origin: Origin(
                        name: "",
                        url: ""
                    ),
                    location: Location(
                        name: "",
                        url: ""
                    ),
                    image: ""
                )
            ])
        )
    }
    
    static var placeholder: RickyAndMortyEntry {
        RickyAndMortyEntry(
            date: Date(),
            characters: .init(results: [
                CharactersResults(
                    id: 0,
                    name: "Morty",
                    status: "",
                    species: "",
                    gender: "",
                    origin: Origin(
                        name: "",
                        url: ""
                    ),
                    location: Location(
                        name: "",
                        url: ""
                    ),
                    image: ""
                )
            ]),
            isPlaceholder: true
        )
    }
}
