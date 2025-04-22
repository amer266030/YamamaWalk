//
//  Login.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct LoginRequest: Codable {
    var email: String
    var pin: String
}

typealias LoginResponse = User
