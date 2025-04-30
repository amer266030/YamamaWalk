//
//  HomeVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

class HomeVM: ObservableObject {
    private let x = DIContainer.shared
    @Published var events = EventsResponse()
    @Published var liveStepCount: Int = 0
    @AppStorage("lastSyncAt") var lastSyncAt: String = ""
    @AppStorage("totalSteps") var totalSteps: Int = 0
    
    @MainActor
    var syncDate: Date? {
        if lastSyncAt.isEmpty { updateSyncDate() }
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: lastSyncAt)
    }
    
    init() { }
    
    // MARK: - Helper Function
    
    @MainActor
    func updateSyncDate() {
        let formatter = ISO8601DateFormatter()
        lastSyncAt = formatter.string(from: Date())
    }
    
    // MARK: - HealthKit
    
    @MainActor
    func startLiveTracking() async {
        guard let since = syncDate else { return }

        do {
            if let initialSteps = try await x.healthKit.fetchSteps(since: since) {
                DispatchQueue.main.async {
                    self.liveStepCount = initialSteps
                }
                x.healthKit.startLiveStepUpdates(from: initialSteps, since: since) { newLiveSteps in
                    self.liveStepCount = initialSteps + newLiveSteps
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
            let _: AddStepsResponse = try await StepsAPI.sendRequest(to: .addSteps, body: request)
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
