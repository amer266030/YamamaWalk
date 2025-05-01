//
//  UpdateSteps.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct AddStepsRequest: Codable {
    var event_id: String = "1"
    var event_branch_id: String
    var steps: String
}

struct AddStepsResponse: Codable {
    var id: Int?
    var userId: String?
    var eventId: String?
    var eventBranchId: String?
    var steps: Int?
    var calories: Int?
    var rank: Int?
    var totalSteps: Int?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, steps, calories, rank
        case userId = "user_id"
        case eventId = "event_id"
        case eventBranchId = "event_branch_id"
        case totalSteps = "total_steps"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

}
