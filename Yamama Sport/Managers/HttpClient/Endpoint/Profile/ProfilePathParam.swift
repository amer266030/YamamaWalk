//
//  ProfilePathParam.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum ProfilePathParam {
    case updateProfile(UpdateProfileRequest.Type)
    case updateSteps(UpdateStepsRequest.Type)
    case getUsers(GetUsersRequest.Type)
    case getProfile
    
    var path: String {
        switch self {
        case .updateProfile:
            return "update-profile"
        case .updateSteps:
            return "update-steps"
        case .getUsers:
            return "users"
        case .getProfile:
            return ""
        }
    }
}
