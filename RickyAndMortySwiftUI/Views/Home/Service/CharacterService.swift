//
//  CharacterService.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 29/06/21.
//

import Foundation
import Combine

protocol CharacterService {
    var apiSession: APIService {get}
    
    func getCharacterList() -> AnyPublisher<CharactersModel, APIError>
}

extension CharacterService {
    
    func getCharacterList() -> AnyPublisher<CharactersModel, APIError> {
        return apiSession.request(with: CharactersEndpoint.charactersList)
            .eraseToAnyPublisher()
    }
}
