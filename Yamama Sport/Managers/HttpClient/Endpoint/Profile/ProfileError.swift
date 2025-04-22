//
//  ProfileError.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum ProfileError: Error {
    case missingProfileData
    case missingStatsData
}

extension ProfileError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingProfileData:
            return "Missing Profile Data"
        case .missingStatsData:
            return "Could not load stats"
        }
    }
}
