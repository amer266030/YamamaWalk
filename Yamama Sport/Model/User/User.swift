//
//  User.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
    let gender: Gender?
    let roles: [UserRole]?
    var department: String?
    
    let emailVerifiedAt: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case email
        case emailVerifiedAt = "email_verified_at"
        case gender
        case id
        case name
        case phone
        case roles
        case updatedAt = "updated_at"
    }
    
    init(id: Int? = nil, name: String? = nil, email: String? = nil, phone: String? = nil, gender: Gender? = nil, roles: [UserRole]? = nil, emailVerifiedAt: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, deletedAt: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.gender = gender
        self.roles = roles
        self.emailVerifiedAt = emailVerifiedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}
