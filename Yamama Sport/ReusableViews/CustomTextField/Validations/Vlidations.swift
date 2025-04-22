//
//  Vlidations.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class Validations {
    static func validate(type: ValidationsType) -> String? {
        switch type {
        case .email(value: let value):
            return validateEmail(value) ? nil : "Invalid email format"
        case .phone(value: let value):
            return validatePhone(value) ? nil : "Invalid phone number"
        case .nonEmpty(value: let value):
            return validateNonEmpty(value) ? nil : "This field cannot be empty"
        case .none:
            return nil
        }
    }
}
