//
//  APIError.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 29/06/21.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidServerResponse
    case invalidData
}

extension APIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidURL:
            return "Bad URL"
        case .invalidServerResponse:
            return "The server did not return 200"
        case .invalidData:
            return "The server returned bad data"
        }
    }
}
