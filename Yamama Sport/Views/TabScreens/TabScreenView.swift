//
//  TabScreenView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct TabScreenView: View {
    @StateObject var vm = TabScreenVM()
    @Binding var selectedTab: SelectedTab
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(.white.gradient)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                HeaderView(title: vm.selectedTab.title) {
                    Task { await vm.logout() }
                }

                ScrollView(.vertical) {
                    selectedTab.view
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    ForEach(SelectedTab.allCases.indices, id: \.self) { index in
                        let tab = SelectedTab.allCases[index]
                        AnimatedButton {
                            Task { await vm.selectTab(tab) }
                        } label: {
                            Image(systemName: tab.icon)
                                .font(.title3)
                                .fontWeight(selectedTab == tab ? .bold : .regular)
                                .foregroundStyle(selectedTab == tab ? .appPrimary : .gray)
                        }
                        
                        if index != SelectedTab.allCases.count - 1 {
                            Spacer()
                        }
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(.white, in: .capsule)
            }
            .padding(.horizontal, 32)
        }
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
