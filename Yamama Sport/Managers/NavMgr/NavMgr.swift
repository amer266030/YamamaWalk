//
//  NavMgr.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

class NavMgr: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: SelectedTab = .home
    
    static let shared = NavMgr()
    
    private init() {}
    
    /// Push a new route onto the stack
//    @MainActor
    func push(_ route: AppRoute) {
        withAnimation(.easeInOut(duration: 0.4)) {
            path.append(route)
        }
    }

    /// Pop the last screen from the stack
//    @MainActor
    func pop() {
        if path.count > 0 {
            withAnimation(.easeOut(duration: 0.5)) {
                path.removeLast()
            }
        }
    }

    /// Reset to root
//    @MainActor
    func reset() {
        withAnimation(.easeOut(duration: 0.5)) {
            path = NavigationPath()
            selectedTab = .home
        }
    }
    
    /// Replace the navigation stack with a new route
//    @MainActor
    func replaceWith(_ route: AppRoute) {
        withAnimation(.easeInOut(duration: 0.5)) {
            path = NavigationPath()
            path.append(route)
        }
    }
}

