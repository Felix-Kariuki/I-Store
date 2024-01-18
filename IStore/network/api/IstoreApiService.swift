//
//  IstoreService.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation
import Combine


protocol IstoreApiService {
    func request<T: Decodable>(from endpoint: IstoreApi) -> AnyPublisher<T, APIError>
}


struct IstoreApiServiceImpl: IstoreApiService {
    func request<T: Decodable>(from endpoint: IstoreApi) -> AnyPublisher<T, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: T.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
