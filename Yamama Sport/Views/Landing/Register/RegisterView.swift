//
//  RegisterView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm = RegisterVM()
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(LinearGradient.primary)
                .ignoresSafeArea()
            
            VStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 40) {
                        LogoView()
                        RegisterFormView(vm: vm)
                        AlreadyRegisteredView(vm: vm)
                    }
                    .padding(32)
                }
            }
        }
    }
}

#Preview {
    let x = DIContainer.shared
    
    ContentView()
        .onAppear {
            x.navMgr.push(.register)
        }
}
