//
//  EventError.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

enum EventError: Error {
    case missingEvents
}

extension EventError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingEvents:
            return "Missing Events Data"
        }
    }
}
