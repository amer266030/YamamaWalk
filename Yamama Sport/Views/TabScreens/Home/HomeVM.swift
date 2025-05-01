//
//  HomeVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

class HomeVM: ObservableObject {
    private let x = DIContainer.shared
    @Published var currentRank: Int?
    @Published var liveStepCount: Int = 0
    @AppStorage("lastSyncAt") var lastSyncAt: String = ""
    @AppStorage("totalSteps") var totalSteps: Int = 0
    var rankString: LocalizedStringKey { rankString(currentRank) }
    
    @MainActor
    var syncDate: Date {
        if lastSyncAt.isEmpty { updateSyncDate() }
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: lastSyncAt) ?? .now
    }
    
    init() { }
    
    // MARK: - Helper Functions
    
    @MainActor
    func updateSyncDate() {
        let formatter = ISO8601DateFormatter()
        lastSyncAt = formatter.string(from: Date.now)
    }
    
    private func rankString(_ rank: Int?) -> LocalizedStringKey {
        guard let rank = rank else { return "last" }

        let suffix: String
        let ones = rank % 10
        let tens = (rank / 10) % 10

        if tens == 1 {
            suffix = "th"
        } else {
            switch ones {
            case 1: suffix = "st"
            case 2: suffix = "nd"
            case 3: suffix = "rd"
            default: suffix = "th"
            }
        }

        return "\(rank)\(suffix)"
    }
    
    // MARK: - HealthKit
    
    @MainActor
    func startLiveTracking() async {
        let since = syncDate

        do {
            if let initialSteps = try await x.healthKit.fetchSteps(since: since) {
                self.liveStepCount = initialSteps

                x.healthKit.startLiveStepUpdates(from: initialSteps, since: since) { newLiveSteps in
                    print("New steps:", newLiveSteps)
                    Task { @MainActor in
                        self.liveStepCount = initialSteps + newLiveSteps
                    }
                }
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.healthKitError(error))
        }
    }

    
    // MARK: - API
    
    @MainActor
    func addSteps() async throws {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        let branchId: String = x.appMgr.department.intValue
        
        do {
            let totalSteps = totalSteps + liveStepCount
            let request = AddStepsRequest(event_branch_id: branchId, steps: "\(totalSteps)")
            let response: AddStepsResponse = try await StepsAPI.sendRequest(to: .addSteps, body: request)
            
            self.currentRank = response.rank
            self.totalSteps += liveStepCount
            self.liveStepCount = 0
            
            updateSyncDate()
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError {
                liveStepCount += 1
                self.totalSteps += liveStepCount
                self.liveStepCount = 0
                updateSyncDate()
            } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
    
}
