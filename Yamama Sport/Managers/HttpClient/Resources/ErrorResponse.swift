//
//  ErrorResponse.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct ErrorResponse: Error, Codable {
    var email: [String]?
    var phone: [String]?
}

extension ErrorResponse: LocalizedError {
    var errorDescription: String? {
        var messages: [String] = []
        
        if let emailErrors = email, !emailErrors.isEmpty {
            messages.append("Email is already being used")
        }
        
        if let phoneErrors = phone, !phoneErrors.isEmpty {
            messages.append("Phone is already being used")
        }
        
        return messages.isEmpty ? nil : messages.joined(separator: "\n")
    }
}
