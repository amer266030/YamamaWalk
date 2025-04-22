//
//  MockData.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class MockData {
    
    static let shared = MockData()
    
    private init() {
        fetchData()
    }
    
    var currentUser: User?
    var allUsers: [User] = []
    
    private func fetchData() {
        fetchUser()
        fetchUsers()
    }
    
    private func fetchUser() {
        currentUser = User(
            firstName: "John",
            lastName: "Doe",
            email: "jdoe@example.com",
            dob: Date.now,
            gender: .male,
            nationality: "Saudi Arabia",
            stepRecords: generateRandomSteps(days: 30)
        )
    }
    
    private func generateRandomSteps(days: Int) -> [FootSteps] {
        let calendar = Calendar.current
        var steps = [FootSteps]()

        for i in 0..<days {
            if let date = calendar.date(byAdding: .day, value: -i, to: Date()) {
                let stepCount = Int.random(in: 1000...10000)
                steps.append(FootSteps(stepCount: stepCount, date: date))
            }
        }

        return steps
    }
    
    private func fetchUsers() {
        allUsers = [
            User(
                firstName: "Jack",
                lastName: "Sparrow",
                email: "jdoe@example.com",
                dob: Date.now,
                gender: .male,
                nationality: "Saudi Arabia",
                stepRecords: generateRandomSteps(days: 15)
            ),
            User(
                firstName: "Jane",
                lastName: "Doe",
                email: "jane@example.com",
                dob: Date.now,
                gender: .male,
                nationality: "Saudi Arabia",
                stepRecords: generateRandomSteps(days: 10)
            ),
            User(
                firstName: "James",
                lastName: "Bond",
                email: "jdoe@example.com",
                dob: Date.now,
                gender: .male,
                nationality: "Saudi Arabia",
                stepRecords: generateRandomSteps(days: 12)
            ),
        ]
    }
    
}
