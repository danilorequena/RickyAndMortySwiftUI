//
//  ApiServiceError.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 24/06/21.
//

import Foundation

enum APIServiceError: Error {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

