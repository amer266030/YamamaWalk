//
//  Branch.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 30/04/2025.
//

import Foundation

struct Branch: Codable {
    let id: Int?
    let name: String?
    
    var department: Department {
        switch id {
        case 1: .headOffice
        default : .factory
        }
    }
    
}
