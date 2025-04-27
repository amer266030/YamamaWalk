//
//  UserRole.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct UserRole: Codable {
    let createdAt: String?
    let guardName: String?
    let id: Int?
    let name: String?
    let pivot: Pivot?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case guardName = "guard_name"
        case id
        case name
        case pivot
        case updatedAt = "updated_at"
    }
}
