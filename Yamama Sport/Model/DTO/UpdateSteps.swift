//
//  UpdateSteps.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct AddStepsRequest: Codable {
    var eventId: String
    var eventBranchId: String
    var steps: String
    var calories: String
}

struct AddStepsResponse: Codable {
    
}
