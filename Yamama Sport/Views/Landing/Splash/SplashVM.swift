//
//  SplashVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class SplashVM: ObservableObject {
    private let x = DIContainer.shared
    
    @MainActor
    func navigateToLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.x.navMgr.replaceWith(.login)
        }
    }
}
