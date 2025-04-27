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
    @Published var steps: Int?
    @Published var calories: Int?
    
    init() {}
    
    // MARK: - HealthKit
    
    @MainActor
    func fetchStepsAndCalories(forPastDays days: Int) async {
        async let steps = try? x.healthKit.fetchSteps(forPastDays: days)
        async let calories = try? x.healthKit.fetchCalories(forPastDays: days)
        
        self.steps = await steps ?? 0
        self.calories = await calories ?? 0
    }
    
    @MainActor
    private func fetchSteps(forPastDays days: Int) async {
        do {
            let response = try await x.healthKit.fetchSteps(forPastDays: days)
            self.steps = response
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.healthKitError(error))
        }
    }
    
    @MainActor
    private func fetchCalories(forPastDays days: Int) async {
        do {
            let calories = try await x.healthKit.fetchCalories(forPastDays: days)
            self.calories = calories
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.healthKitError(error))
        }
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
                print(error)
            } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
    
    @MainActor
    func updateSteps() async {
        
        
        // Get Steps from Health App
        
    }
    
}
