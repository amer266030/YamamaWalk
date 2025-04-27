//
//  LoginFormView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct LoginFormView: View {
    @ObservedObject var vm: LoginVM
    
    var body: some View {
        CustomTextField(hint: "email", value: $vm.email, type: .email) { isValid in
            vm.isEmailValid = isValid
        }
        CustomTextField(hint: "pin", value: $vm.pin, characterLimit: 6)
        
        PrimaryButton(title: "Login") {
            Task { try await vm.login() }
        }
    }
}

#Preview {
    LoginFormView(vm: LoginVM())
}
