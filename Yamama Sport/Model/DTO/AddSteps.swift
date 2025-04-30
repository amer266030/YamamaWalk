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
    
}
