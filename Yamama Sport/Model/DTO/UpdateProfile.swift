//
//  UpdateProfile.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct UpdateProfileRequest: Codable {
    var img: Data?
    var dob: Date?
    var gender: Gender
}

typealias UpdateProfileResponse = User
