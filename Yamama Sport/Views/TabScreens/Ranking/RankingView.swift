//
//  RankingView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct RankingView: View {
    @StateObject var vm = RankingVM()
    
    var body: some View {
        VStack (spacing: 32) {
            ForEach(vm.allUsers) { user in
                UserRankCardView(user: user)
            }
            
            Text("Time Remaining")
                .foregroundStyle(.appSecondary)
            
            HStack {
                Image(systemName: "alarm")
                CountDownTimerView(timeRemaining: $vm.timeRemaining) { timerExpired in
                    
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 32)
            .foregroundStyle(.bg)
            .background(.appSecondary, in: .rect(cornerRadius: 8))
        }
        .onAppear { Task { await vm.getUsers() } }
    }
}

#Preview {
    let x = DIContainer.shared
    
    ContentView()
        .onAppear {
            x.navMgr.selectedTab = .ranking
            x.navMgr.push(.tabBar)
        }
}
