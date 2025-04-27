//
//  Register.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct RegisterRequest: Codable {
    var name: String
    var email: String
    var password: String
    var gender: Gender
    var phone: String
}

typealias RegisterResponse = AuthResponse
