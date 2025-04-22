//
//  AuthError.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum AuthError: Error {
    case firstNameRequired
    case lastNameRequired
    case invalidEmail
    case invalidPin
    case missingAccessToken
    case mustAgreeToTerms
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .firstNameRequired:
            return "First Name is Required"
        case .lastNameRequired:
            return "Last Name is Required"
        case .invalidEmail:
            return "Invalid Email Entry"
        case .invalidPin:
            return "Invalid PIN Entry"
        case .missingAccessToken:
            return "Access token is missing from the response!"
        case .mustAgreeToTerms:
            return "You must agree to the terms and conditions."
        }
    }
}
