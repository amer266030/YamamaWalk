//
//  AuthResponse.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct AuthResponse: Codable {
    let roles: [String]?
    let token: String?
    let user: User?
}
