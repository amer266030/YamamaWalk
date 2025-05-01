//
//  SyncStepsView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 30/04/2025.
//

import SwiftUI

struct SyncStepsView: View {
    @ObservedObject var vm: HomeVM
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if vm.liveStepCount > 0 {
                AnimatedButton {
                    action()
                } label: {
                    Label("Sync Steps", systemImage: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(.indigo, in: .rect(cornerRadius: 8))
                }
            }

            Text("Last Update: \(vm.syncDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.caption)
        }
    }
}

#Preview {
    SyncStepsView(vm: HomeVM()) {}
}
