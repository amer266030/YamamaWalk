//
//  Register.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct RegisterRequest: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var pin: String
}

typealias RegisterResponse = User
