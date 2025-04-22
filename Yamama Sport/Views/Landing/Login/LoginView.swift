//
//  LoginView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginVM()
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(LinearGradient.primary)
                .ignoresSafeArea()
            
            VStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 32) {
                        LogoView()
                        LoginFormView(vm: vm)
                        ForgotPinView(vm: vm)
                    }
                    .padding(32)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    let x = DIContainer.shared
    ContentView()
        .onAppear {
            x.navMgr.push(.login)
        }
}
