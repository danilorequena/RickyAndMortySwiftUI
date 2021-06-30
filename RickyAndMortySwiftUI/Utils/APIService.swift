//
//  APIService.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 29/06/21.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
