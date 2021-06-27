//
//  CharactersViewModel.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 27/06/21.
//


import Foundation
import UIKit


protocol CharactersProtocol: AnyObject {
    func fetchDiscoverMovies()
}

protocol CharactersViewModelDelegate: AnyObject {
    func charactersList()
    func errorList()
}

class CharactersViewModel: ObservableObject {
    weak var delegate: CharactersViewModelDelegate?
    @Published var characters: CharactersModel?
    
    init() {
        CharactersService.loadCharacters(page: "1") { (
            result: Result<CharactersModel, APIServiceError>) in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.delegate?.charactersList()
                
            case .failure:
                self.delegate?.errorList()
            }
        }
    }
}

