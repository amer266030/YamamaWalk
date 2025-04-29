//
//  UpdateSteps.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct AddStepsRequest: Codable {
    var eventId: Int = 6
    var eventBranchId: Int
    var steps: String
    var calories: String?
}

struct AddStepsResponse: Codable {
    
}
