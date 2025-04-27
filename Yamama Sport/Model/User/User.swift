//
//  User.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var gender: Gender?
    var roles: [UserRole]?
    var department: String?
    
    var emailVerifiedAt: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?

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
        case department
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(Int.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        email = try? container.decode(String.self, forKey: .email)
        phone = try? container.decode(String.self, forKey: .phone)
        roles = try? container.decode([UserRole].self, forKey: .roles)
        department = try? container.decode(String.self, forKey: .department)
        
        emailVerifiedAt = try? container.decode(String.self, forKey: .emailVerifiedAt)
        createdAt = try? container.decode(String.self, forKey: .createdAt)
        updatedAt = try? container.decode(String.self, forKey: .updatedAt)
        deletedAt = try? container.decode(String.self, forKey: .deletedAt)
        
        // Handle gender separately
        if let genderString = try? container.decode(String.self, forKey: .gender) {
            gender = Gender(rawValue: genderString.lowercased())
        } else if let genderInt = try? container.decode(Int.self, forKey: .gender) {
            switch genderInt {
            case 0, 2:
                gender = .female
            case 1:
                gender = .male
            default:
                gender = nil
            }
        } else {
            gender = nil
        }
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
