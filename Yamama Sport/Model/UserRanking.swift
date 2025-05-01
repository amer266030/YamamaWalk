//
//  UserRanking.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 30/04/2025.
//

import Foundation

struct UserRanking: Codable, Identifiable {
    let id = UUID().uuidString
    let name: String?
    let gender: Gender?
    let totalSteps: Int?
    let userId: Int?
    let rank: Int?
    let branch: Branch?

    enum CodingKeys: String, CodingKey {
        case name, gender, branch, rank
        case totalSteps = "total_steps"
        case userId = "user_id"
    }
    
}
