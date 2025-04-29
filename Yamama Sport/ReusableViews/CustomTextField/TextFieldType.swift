//
//  TextFieldType.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import UIKit

enum TextFieldType {
    case email
    case phone
    case numbers
    case standard
    case pwd
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        case .phone:
            return .phonePad
        case .numbers:
            return .numberPad
        case .standard, .pwd:
            return .default
        }
    }
    
    func validate(value: String) -> String? {
        switch self {
        case .email:
            return Validations.validate(type: .email(value))
        case .phone:
            return Validations.validate(type: .phone(value))
        case .numbers:
            return Validations.validate(type: .none)
        case .standard, .pwd:
            return Validations.validate(type: .nonEmpty(value))
        }
    }
    
}
