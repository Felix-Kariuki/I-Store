//
//  ApiError.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self{
        case .decodingError:
            return "Failed to decode error from the service"
        case .errorCode(let code):
            return "\(code) - Something Went Wrong"
        case .unknown:
            return "The error is unknown"
        }
        
    }
}
