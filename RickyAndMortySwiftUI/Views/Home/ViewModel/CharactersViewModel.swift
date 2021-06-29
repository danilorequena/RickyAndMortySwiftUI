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
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getCharactersList() {
        let cancellable = self.getCharacterList()
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print("Handle error: \(error)")
                }
            } receiveValue: { characters in
                self.characters = characters.results
            }
        cancellables.insert(cancellable)
    }
    
//    func getCharactersList() {
//        let cancellable = self.getCharactersList()
//            .sink(receiveCompletion: { result in
//                switch result {
//                case .failure(let error):
//                    print("Handle error: \(error)")
//                case .finished:
//                    break
//                }
//
//            }) { (characters) in
//                self.characters = characters
//            }
//        cancellables.insert(cancellable)
//    }
    
    //    func fetchCharacters() {
    //        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
    //            .tryMap{ $0.data }
    //            .decode(type: [CharactersResults].self, decoder: JSONDecoder())
    //            .receive(on: RunLoop.main)
    //            .catch{ _ in Just(self.characters)}
    //            .sink { characters in
    //                self.page += 1
    //                self.characters.append(contentsOf: characters)
    //                if self.characters.count < self.perPage {
    //                    self.membersListFull = true
    //                }
    //            }
    //    }
    
    //    func fetchCharacters() {
    //        CharactersService.loadCharacters(page: "\(page+1)") { (
    //            result: Result<CharactersModel, APIServiceError>) in
    //            switch result {
    //            case .success(let characters):
    //                self.page += 1
    //                self.characters?.results += characters.results
    //                self.delegate?.charactersList()
    //                if characters.results.count < self.perPage {
    //                    self.membersListFull = true
    //                }
    //
    //            case .failure:
    //                self.delegate?.errorList()
    //            }
    //        }
    //    }
}

