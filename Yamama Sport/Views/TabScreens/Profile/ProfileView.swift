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
                    listInfoItem("\(vm.user.name ?? "")")
                    listInfoItem(AppMgr.shared.department.strValue)
                    SegmentedTabView(selectedTab: $vm.gender)
                        .allowsHitTesting(false)
                }
                .padding(40)
                .background(LinearGradient.primary, in: .rect(cornerRadii: .init(topLeading: 8, bottomLeading: 56, bottomTrailing: 56, topTrailing: 8)))
            }
        }
    }
}

fileprivate func listInfoItem(_ title: LocalizedStringKey) -> some View {
    HStack {
        Text(title)
            .bold()
    }
    .frame(maxWidth: .infinity)
    .padding()
    .foregroundStyle(.appPrimary)
    .background(.white, in: .rect(cornerRadius: 16))
}


#Preview {
    let x = DIContainer.shared
    
    ContentView()
        .onAppear {
            x.navMgr.selectedTab = .profile
            x.navMgr.push(.tabBar)
        }
}
