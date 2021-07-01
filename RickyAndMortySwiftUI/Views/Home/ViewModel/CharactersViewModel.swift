//
//  CharactersViewModel.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 27/06/21.
//


import Foundation
import SwiftUI
import Combine

class CharactersViewModel: ObservableObject, CharacterService {
    
    var apiSession: APIService
    @Published var characters = [CharactersResults]()
    var cancellables = Set<AnyCancellable>()
    var perPage = 20
    var currentPage = 0
    var listFull = false
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getCharactersList() {
        let cancellable = self.getCharacterList(page: currentPage + 1)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print("Handle error: \(error)")
                }
            } receiveValue: { characters in
                self.currentPage += 1
                self.characters += characters.results
                if self.characters.count < self.perPage {
                    self.listFull = true
                }
            }
        cancellables.insert(cancellable)
    }
}

