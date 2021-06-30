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
    
    func getCharacterList(page: Int) -> AnyPublisher<CharactersModel, APIError>
}

extension CharacterService {
    
    func getCharacterList(page: Int) -> AnyPublisher<CharactersModel, APIError> {
        return apiSession.request(with: CharactersEndpoint.charactersList(page: page))
            .eraseToAnyPublisher()
    }
}
