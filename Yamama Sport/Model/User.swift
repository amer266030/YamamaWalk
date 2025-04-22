//
//  User.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct User: Codable {
    // HTTP Response Attributes
    var accessToken: String?
    var pin: String?
    // Saved Attributes
    var firstName: String?
    var lastName: String?
    var email: String?
    var dob: Date?
    var gender: Gender?
    var nationality: String?
    var stepRecords: [FootSteps]?
    var image: Data?
    
    init(firstName: String? = nil, lastName: String? = nil, email: String? = nil, dob: Date? = nil, gender: Gender? = nil, nationality: String? = nil, stepRecords: [FootSteps] = []) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dob = dob
        self.gender = gender
        self.nationality = nationality
        self.stepRecords = stepRecords
    }
}

extension User {
    func averageSteps(forDaysBack days: Int) -> Int {
        let calendar = Calendar.current
        let cutoffDate = calendar.date(byAdding: .day, value: -days, to: Date())!

        if let stepRecords {
            let filteredSteps = stepRecords.filter { $0.date >= cutoffDate }
            guard !filteredSteps.isEmpty else { return 0 }

            let total = filteredSteps.reduce(0) { $0 + $1.stepCount }
            return total / filteredSteps.count
        }
        return 0
    }

    var weeklyAverage: Int {
        averageSteps(forDaysBack: 7)
    }

    var monthlyAverage: Int {
        averageSteps(forDaysBack: 30)
    }
}
