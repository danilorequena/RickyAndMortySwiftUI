//
//  RickyAndMortyProvider.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 01/11/21.
//

import SwiftUI
import WidgetKit

struct RickyAndMortyProvider: TimelineProvider {
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
        let date = Date()
        fetchCharacters { (result) in
            switch result {
            case .success(let entry):
                let nextUpdate = Calendar.current.date(byAdding: .minute, value: 2, to: date)!
                let timeline  = Timeline(entries: [entry], policy: .after(nextUpdate))
                completion(timeline)
            case .failure:
                let timeline = Timeline(entries: [RickyAndMortyEntry.placeholder], policy: .after(Date().addingTimeInterval(60 * 2)))
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
