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
            HStack {
                Text("Don't have an account?")
                AnimatedButton {
                    vm.navigateToRegister()
                } label: {
                    Text("Create Account")
                        .underline()
                        .fontWeight(.semibold)
                }
            }
        }
        .foregroundStyle(.bg)
    }
}

#Preview {
    ForgotPinView(vm: LoginVM())
}
