//
//  HealthKitMgr.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation
import HealthKit

class HealthKitMgr: ObservableObject {
    @Published var healthStore: HKHealthStore?
    @Published var error: Error? = nil
    private var liveQuery: HKQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            error = StepCounterError.couldNotFetchHealthStore
        }
    }
    
    func requestAuth() async {
        guard let healthStore else { return }
        
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount),
              let activeEnergyBurnedType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
            return
        }
        
        let readTypes: Set<HKObjectType> = [stepCountType, activeEnergyBurnedType]
        
        do {
            try await healthStore.requestAuthorization(toShare: [], read: readTypes)
        } catch {
            self.error = error
        }
    }
    
    func isAuthorized() -> Bool {
        guard let healthStore else { return false }
        
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount),
              let activeEnergyBurnedType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
            return false
        }
        
        let stepStatus = healthStore.authorizationStatus(for: stepCountType)
        let caloriesStatus = healthStore.authorizationStatus(for: activeEnergyBurnedType)
        
        return stepStatus == .sharingAuthorized && caloriesStatus == .sharingAuthorized
    }
    
    @MainActor
    func fetchSteps(forPastDays days: Int) async throws -> Int? {
        guard let healthStore else { return nil }
        
        if !isAuthorized() { await requestAuth() }
        
        let calendar = Calendar.current
        let endDate = Date()
        let startDate = calendar.date(byAdding: .day, value: -days, to: endDate)!
        
        let healthStepType = HKQuantityType(.stepCount)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sample = HKSamplePredicate.quantitySample(type: healthStepType, predicate: predicate)
        
        let anchorDate = calendar.startOfDay(for: startDate)
        let interval = DateComponents(day: 1)
        
        let stepsQuery = HKStatisticsCollectionQueryDescriptor(
            predicate: sample,
            options: .cumulativeSum,
            anchorDate: anchorDate,
            intervalComponents: interval
        )
        
        let stepsData = try await stepsQuery.result(for: healthStore)
        
        var totalSteps: Double = 0
        
        stepsData.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
            if let quantity = statistics.sumQuantity() {
                totalSteps += quantity.doubleValue(for: .count())
            }
        }
        return Int(totalSteps)
    }
    
    @MainActor
    func fetchSteps(since startDate: Date) async throws -> Int? {
        guard let healthStore else { return nil }
        
        if !isAuthorized() { await requestAuth() }
        
        let endDate = Date()
        let healthStepType = HKQuantityType(.stepCount)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sample = HKSamplePredicate.quantitySample(type: healthStepType, predicate: predicate)
        
        let anchorDate = Calendar.current.startOfDay(for: startDate)
        let interval = DateComponents(day: 1)
        
        let stepsQuery = HKStatisticsCollectionQueryDescriptor(
            predicate: sample,
            options: .cumulativeSum,
            anchorDate: anchorDate,
            intervalComponents: interval
        )
        
        let stepsData = try await stepsQuery.result(for: healthStore)
        
        var totalSteps: Double = 0
        stepsData.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
            if let quantity = statistics.sumQuantity() {
                totalSteps += quantity.doubleValue(for: .count())
            }
        }
        return Int(totalSteps)
    }
    
    func startLiveStepUpdates(from baseline: Int = 0, since: Date, onUpdate: @escaping (Int) -> Void) {
        guard let healthStore,
              let stepType = HKObjectType.quantityType(forIdentifier: .stepCount)
        else { return }

        let predicate = HKQuery.predicateForSamples(withStart: since, end: nil)

        let query = HKAnchoredObjectQuery(
            type: stepType,
            predicate: predicate,
            anchor: nil,
            limit: HKObjectQueryNoLimit
        ) { _, samples, _, _, _ in
            self.process(samples: samples, from: baseline, onUpdate: onUpdate)
        }

        query.updateHandler = { _, samples, _, _, _ in
            self.process(samples: samples, from: baseline, onUpdate: onUpdate)
        }

        healthStore.execute(query)
        liveQuery = query
    }

    private func process(samples: [HKSample]?, from baseline: Int, onUpdate: @escaping (Int) -> Void) {
        guard let quantitySamples = samples as? [HKQuantitySample] else { return }

        let stepUnit = HKUnit.count()
        let newSteps = quantitySamples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: stepUnit) }

        DispatchQueue.main.async {
            onUpdate(Int(newSteps))
        }
    }
    
    @MainActor
    func fetchCalories(forPastDays days: Int) async throws -> Int? {
        guard let healthStore else { return nil }
        
        if !isAuthorized() { await requestAuth() }
        
        let calendar = Calendar.current
        let endDate = Date()
        let startDate = calendar.date(byAdding: .day, value: -days, to: endDate)!
        
        let calorieType = HKQuantityType(.activeEnergyBurned)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sample = HKSamplePredicate.quantitySample(type: calorieType, predicate: predicate)
        
        let anchorDate = calendar.startOfDay(for: startDate)
        let interval = DateComponents(day: 1)
        
        let caloriesQuery = HKStatisticsCollectionQueryDescriptor(
            predicate: sample,
            options: .cumulativeSum,
            anchorDate: anchorDate,
            intervalComponents: interval
        )
        
        let caloriesData = try await caloriesQuery.result(for: healthStore)
        
        var totalCalories: Double = 0
        
        caloriesData.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
            if let quantity = statistics.sumQuantity() {
                totalCalories += quantity.doubleValue(for: .kilocalorie())
            }
        }
        
        return Int(totalCalories)
    }
}
