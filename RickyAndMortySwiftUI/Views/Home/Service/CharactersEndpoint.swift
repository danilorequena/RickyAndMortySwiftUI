//
//  CharactersEndpoint.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 29/06/21.
//

import Foundation

enum CharactersEndpoint {
    case charactersList(page: Int)
}

extension CharactersEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .charactersList(let page):
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
