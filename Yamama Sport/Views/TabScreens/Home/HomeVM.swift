//
//  HomeVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class HomeVM: ObservableObject {
    private let x = DIContainer.shared
    @Published var events = EventsResponse()
    @Published var weekSteps: Int?
    @Published var monthSteps: Int?
    @Published var weekCalories: Int?
    @Published var monthCalories: Int?
    
    init() {}
    
    // MARK: - HealthKit
    
    @MainActor
    func fetchStepsAndCalories(forPastDays days: Int) async {
        async let weekSteps = try? x.healthKit.fetchSteps(forPastDays: 7)
        async let monthSteps = try? x.healthKit.fetchSteps(forPastDays: 30)
        async let weekCalories = try? x.healthKit.fetchCalories(forPastDays: 7)
        async let monthCalories = try? x.healthKit.fetchCalories(forPastDays: 30)
        
        self.weekSteps = await weekSteps ?? 0
        self.monthSteps = await monthSteps ?? 0
        self.weekCalories = await weekCalories ?? 0
        self.monthCalories = await monthCalories ?? 0
    }

    // MARK: - API
    
    @MainActor
    func fetchEvent() async {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            let response: EventsResponse = try await EventAPI.sendRequest(to: .events)
            self.events = response
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError {
                // Implement MockData for Events
            } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
    
    @MainActor
    private func updateSteps() async {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            guard let monthSteps, let monthCalories else { throw StepsError.missingStepsData }
            
            let request = AddStepsRequest(eventId: "", eventBranchId: "", steps: "\(monthSteps)", calories: "\(monthCalories)")
            let response: AddStepsResponse = try await StepsAPI.sendRequest(to: .addSteps, body: request)
            
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError {
                // Implement MockData for Events
            } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
    
}
