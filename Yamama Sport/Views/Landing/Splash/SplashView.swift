//
//  SplashView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var navMgr = NavMgr.shared
    @StateObject var vm = SplashVM()
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(LinearGradient.primary)
                .ignoresSafeArea()
            
            LogoView()
        }
        .onAppear {
            if navMgr.path.count == 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    vm.navigateToLogin()
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
