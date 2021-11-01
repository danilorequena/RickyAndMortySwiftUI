//
//  CharactersViewModel.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 27/06/21.
//


import Foundation
import SwiftUI

final class CharactersViewModel: ObservableObject {
    
//    var apiSession: APIService
    var service = CharactersService()
    @Published var characters = [CharactersResults]()
    var perPage = 20
    var currentPage = 0
    var listFull = false
    
//    init(apiSession: APIService = APISession()) {
//        self.apiSession = apiSession
//    }
//    init(service: CharactersService = CharactersService()) {
//        self.service = service
//    }
    
    //MARK: - implementação com Combine
//    func getCharactersList() {
//        let cancellable = self.getCharacterList(page: currentPage + 1)
//            .sink { result in
//                switch result {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Handle error: \(error)")
//                }
//            } receiveValue: { characters in
//                self.currentPage += 1
//                self.characters += characters.results
//                if self.characters.count < self.perPage {
//                    self.listFull = true
//                }
//            }
//        cancellables.insert(cancellable)
//    }
    
    func getCharactersList() async {
        guard let url = URL(string: Constants.baseURL + "character") else {
            return
        }
        Task.init {
            let result = try await CharactersService.newLoadCharacters(from: url)
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    if self.characters.count < self.perPage {
                        self.listFull = true
                    }
                    self.characters = characters.results
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

