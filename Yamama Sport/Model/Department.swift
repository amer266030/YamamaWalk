//
//  Department.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 28/04/2025.
//

import SwiftUI

enum Department: String, Codable, Identifiable, CaseIterable {
    case headOffice
    case factory
    
    var id: String { self.rawValue }
    
    var strValue: LocalizedStringKey {
        switch self {
        case .headOffice: "Head Office"
        case .factory: "Factory"
        }
    }
    
    var intValue: String {
        switch self {
        case .headOffice: "1"
        case .factory: "2"
        }
    }
    
}
