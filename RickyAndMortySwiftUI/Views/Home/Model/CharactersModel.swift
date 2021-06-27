//
//  CharactersModel.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 24/06/21.
//

import Foundation
import CoreLocation

struct CharactersModel: Codable {
    
    let results: [CharactersResults]
}

struct CharactersResults: Codable, Equatable {
    static func == (lhs: CharactersResults, rhs: CharactersResults) -> Bool {
        return true
    }
    
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Location: Codable {
    let name: String
    let url: String
}