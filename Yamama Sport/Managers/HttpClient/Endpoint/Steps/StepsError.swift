//
//  StepsError.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

enum StepsError: Error {
    case missingStepsData
}

extension StepsError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingStepsData:
            return "Missing Steps Data"
        }
    }
}
