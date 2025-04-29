//
//  AuthError.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum AuthError: Error {
    case nameRequired
    case invalidEmail
    case invalidPin
    case missingAccessToken
    case mustAgreeToTerms
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .nameRequired:
            return "Name is Required"
        case .invalidEmail:
            return "Invalid Email Entry"
        case .invalidPin:
            return "Invalid Password Entry"
        case .missingAccessToken:
            return "Access token is missing from the response!"
        case .mustAgreeToTerms:
            return "You must agree to the terms and conditions."
        }
    }
}
