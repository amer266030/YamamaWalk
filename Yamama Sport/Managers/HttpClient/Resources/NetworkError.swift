//
//  NetworkError.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum NetworkError: Error, Equatable {
    case badRequest
    case decodingError(Error)
    case errorResponse(ErrorResponse)
    case invalidResponse
    case noConnection
    case simulatorError

    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest, .badRequest),
            (.invalidResponse, .invalidResponse),
            (.errorResponse, .errorResponse),
            (.noConnection, .noConnection),
            (.simulatorError, .simulatorError),
            (.decodingError, .decodingError):
            return true
        default:
            return false
        }
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .decodingError(let error):
            return "\(error.localizedDescription)"
        case .errorResponse(let error):
            return "\(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid Response"
        case .noConnection:
            return "No Connection"
        case .simulatorError:
            return "Preview Mode"
        }
    }
}
