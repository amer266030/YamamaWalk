//
//  MockData.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class MockData {
    
    init() {
        fetchData()
    }
    
    var currentUser: User?
    var allUsers: [User] = []
    
    private func fetchData() {
        fetchUser()
    }
    
    private func fetchUser() {
        currentUser = User(
            id: 1,
            name: "John",
            email: "jdoe@example.com",
            phone: "1234",
            gender: .male,
            roles: [UserRole(
                createdAt: nil,
                guardName: nil,
                id: 1,
                name: nil,
                pivot: Pivot(
                    modelId: 1,
                    modelType: "",
                    roleId: 1
                ),
                updatedAt: nil
            )],
            emailVerifiedAt: nil,
            createdAt: nil,
            updatedAt: nil,
            deletedAt: nil
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
    
}
