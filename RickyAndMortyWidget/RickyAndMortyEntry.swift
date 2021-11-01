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
    let characters: CharactersModel
    var isPlaceholder = false
}

extension RickyAndMortyEntry {
    static var stub: RickyAndMortyEntry {
        RickyAndMortyEntry(
            date: Date(),
            characters: .init(results: nil)
        )
    }
    
    static var placeholder: RickyAndMortyEntry {
        RickyAndMortyEntry(
            date: Date(),
            characters: .init(results: nil),
            isPlaceholder: true
        )
    }
}
