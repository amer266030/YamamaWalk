//
//  ForgotPinView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct ForgotPinView: View {
    @ObservedObject var vm: LoginVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Forgot Pin?")
            HStack {
                Text("New User?")
                AnimatedButton {
                    vm.navigateToRegister()
                } label: {
                    Text("Register")
                        .underline()
                }
            }
        }
        .foregroundStyle(.bg)
    }
}

#Preview {
    ForgotPinView(vm: LoginVM())
}
