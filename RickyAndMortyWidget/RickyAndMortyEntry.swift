//
//  RickyAndMortyEntry.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 30/10/21.
//

import Foundation
import WidgetKit

struct RickyAndMortyEntry: TimelineEntry, Codable {
    var date: Date
    var characters: CharactersModel
    var isPlaceholder = false
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
