//
//  Validations_Ext.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

extension Validations {
    // MARK: - TextField Validations
    
    class func validateEmail(_ value: String) -> Bool {
        return value.contains("@") && value.contains(".")
    }
    
    class func validatePhone(_ value: String) -> Bool {
        return value.allSatisfy { $0.isNumber } && value.count >= 9
    }
    
    class func validateNonEmpty(_ value: String) -> Bool {
        return !value.isEmpty
    }
    
}
