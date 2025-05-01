//
//  AuthPathParam.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum AuthPathParam {
    case login(LoginRequest.Type)
    case register(RegisterRequest.Type)

    var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "signup"
        }
    }
}
