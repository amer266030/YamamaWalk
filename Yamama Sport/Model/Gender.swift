//
//  Gender.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

enum Gender: String, Identifiable, CaseIterable, Codable, TabItemProtocol {
    case male
    case female
    
    var id: String { self.rawValue }
    
    var strValue: LocalizedStringKey {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}
