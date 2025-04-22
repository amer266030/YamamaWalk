//
//  AlreadyRegisteredView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct AlreadyRegisteredView: View {
    @ObservedObject var vm: RegisterVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Already Registered?")
                AnimatedButton {
                    vm.navigateToLogin()
                } label: {
                    Text("Login")
                        .underline()
                }
            }
        }
        .foregroundStyle(.bg)
    }
}

#Preview {
    ZStack {
        Color.appPrimary
        AlreadyRegisteredView(vm: RegisterVM())
    }
}
