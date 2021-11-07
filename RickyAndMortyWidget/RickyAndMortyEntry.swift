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
    
    static var largeStub: RickyAndMortyEntry {
        RickyAndMortyEntry(
            date: Date(),
            characters: CharactersModel(
                results: [
                    CharactersResults(
                        id: 0,
                        name: "Ricky",
                        status: "",
                        species: "",
                        gender: "Male",
                        origin: Origin(
                            name: "Earth",
                            url: ""
                        ),
                        location: Location(
                            name: "",
                            url: ""
                        ),
                        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
                    ),
                    CharactersResults(
                        id: 1,
                        name: "Morty",
                        status: "",
                        species: "",
                        gender: "Male",
                        origin: Origin(
                            name: "Earth",
                            url: ""
                        ),
                        location: Location(
                            name: "",
                            url: ""
                        ),
                        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
                    ),
                    CharactersResults(
                        id: 3,
                        name: "Summer",
                        status: "",
                        species: "",
                        gender: "Female",
                        origin: Origin(
                            name: "Earth",
                            url: ""
                        ),
                        location: Location(
                            name: "",
                            url: ""
                        ),
                        image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
                    ),
                    CharactersResults(
                        id: 4,
                        name: "Richard",
                        status: "",
                        species: "",
                        gender: "Male",
                        origin: Origin(
                            name: "Earth",
                            url: ""
                        ),
                        location: Location(
                            name: "",
                            url: ""
                        ),
                        image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"
                    )
                ]
            )
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
