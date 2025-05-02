//
//  TimeView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 01/05/2025.
//

import SwiftUI

struct TimeView: View {
    @ObservedObject var vm: RankingVM
    
    var body: some View {
        VStack(spacing: 8) {
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
    }
}

#Preview {
    TimeView(vm: RankingVM())
}
