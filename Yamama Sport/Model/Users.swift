//
//  Users.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct Users: Codable {
    var allUsers: [User]
    
    init(allUsers: [User]) {
        self.allUsers = allUsers
    }
}
