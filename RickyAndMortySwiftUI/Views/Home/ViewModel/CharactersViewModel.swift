//
//  CharactersViewModel.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 27/06/21.
//


import Foundation
import UIKit


protocol CharactersProtocol: AnyObject {
    func fetchCharacters()
}

protocol CharactersViewModelDelegate: AnyObject {
    func charactersList()
    func errorList()
}

class CharactersViewModel: ObservableObject, CharactersProtocol {
    weak var delegate: CharactersViewModelDelegate?
    var membersListFull = false
    @Published var characters: CharactersModel?
    @Published var page = 0
    @Published var perPage = 20
    
    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        CharactersService.loadCharacters(page: "\(page+1)") { (
            result: Result<CharactersModel, APIServiceError>) in
            switch result {
            case .success(let characters):
                self.page += 1
                self.characters = characters
                self.delegate?.charactersList()
                if characters.results.count < self.perPage {
                    self.membersListFull = true
                }
                
            case .failure:
                self.delegate?.errorList()
            }
        }
    }
}

