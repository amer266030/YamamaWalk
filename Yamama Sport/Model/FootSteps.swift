//
//  FootSteps.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct FootSteps: Codable {
    var stepCount: Int
    var date: Date
    
    init(stepCount: Int, date: Date) {
        self.stepCount = stepCount
        self.date = date
    }
}
