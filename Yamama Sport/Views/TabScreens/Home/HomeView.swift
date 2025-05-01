//
//  HomeView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeVM()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 32) {
            SyncStepsView(vm: vm) { Task { try await vm.addSteps() } }
            
            LazyVGrid(columns: createGridItems(2), spacing: 16) {
                StepsCardView(title: "Synced Steps", steps: $vm.totalSteps)
                StepsCardView(title: "New Steps", steps: $vm.liveStepCount)
            }
            
            PositionCardView(title: "Your position compared to your colleagues", position: vm.rankString)
        }
        .onAppear {
            Task {
                await vm.startLiveTracking()
            }
        }
    }
    
    fileprivate func createGridItems(_ numItems: Int) -> [GridItem] {
        let columns = [GridItem](repeating: GridItem(.flexible(), spacing: 16), count: numItems)
        return columns
    }
}

#Preview {
    let x = DIContainer.shared
    
    ContentView()
        .onAppear {
            x.navMgr.selectedTab = .home
            x.navMgr.push(.tabBar)
        }
}
