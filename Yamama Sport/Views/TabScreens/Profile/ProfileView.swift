//
//  ProfileView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileVM()
    
    var body: some View {
        VStack {
            AsyncImageView(url: URL(string: ""))
            
            VStack (spacing: 16) {
                Text("Saudi")
                .font(.subheadline)
                
                VStack(spacing: 16) {
                    CustomTextField(hint: "", value: .constant("\(vm.user.name ?? "")"), canEdit: false)
                    
                    HStack {
                        Text(AppMgr.shared.department.strValue)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.appPrimary)
                    .background(.white, in: .rect(cornerRadius: 16))
                    
                    SegmentedTabView(selectedTab: $vm.gender)
                        .allowsHitTesting(false)
                }
                .padding(40)
                .background(LinearGradient.primary, in: .rect(cornerRadii: .init(topLeading: 8, bottomLeading: 56, bottomTrailing: 56, topTrailing: 8)))
            }
        }
    }
}

#Preview {
    let x = DIContainer.shared
    
    ContentView()
        .onAppear {
            x.navMgr.selectedTab = .profile
            x.navMgr.push(.tabBar)
        }
}
