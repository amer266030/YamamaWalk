//
//  NavCoordinator.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct NavigationCoordinator: View {
    @ObservedObject var navMgr = NavMgr.shared

    var body: some View {
        NavigationStack(path: $navMgr.path) {
            SplashView()
                .navigationDestination(for: AppRoute.self) { route in
                    destinationView(for: route)
                        .navigationBarBackButtonHidden()
                }
        }
    }

    @ViewBuilder
    func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .splash: SplashView()
        case .login: LoginView()
        case .register: RegisterView()
        case .tabBar: TabScreenView(selectedTab: $navMgr.selectedTab)
        }
    }
}
