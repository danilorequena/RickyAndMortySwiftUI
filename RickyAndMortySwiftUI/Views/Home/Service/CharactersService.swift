//
//  CharactersService.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 24/06/21.
//

import Foundation

final class CharactersService {
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpMaximumConnectionsPerHost = 40
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadCharacters<T: Decodable>(
        page: String,
        complitionHandler: @escaping (Result<T, APIServiceError>) -> ()
    ) {
        guard let queryURL = URL(string: "\(Constants.baseURL)character/") else {
            complitionHandler(.failure(.url))
            return
        }
        
        guard var components = URLComponents(
            url: queryURL,
            resolvingAgainstBaseURL: true
        ) else {
            return
        }
        
        components.queryItems = [URLQueryItem(name: "page", value: page)]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    complitionHandler(.failure(.noResponse))
                    print("No Error")
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let movies = try JSONDecoder().decode(T.self, from: data)
                        complitionHandler(.success(movies))
                        print("FetchOK")
                    } catch let jsonErr {
                        complitionHandler(.failure(.invalidJSON))
                        print("Error serializing json:", jsonErr)
                    }
                } else {
                    complitionHandler(.failure(.responseStatusCode(code: response.statusCode)))
                    print("Algo deu Errado no servidor dos Movies")
                }
            } else {
                complitionHandler(.failure(.taskError(error: error!)))
                print("Algo errado")
            }
        }
        dataTask.resume()
    }
}
