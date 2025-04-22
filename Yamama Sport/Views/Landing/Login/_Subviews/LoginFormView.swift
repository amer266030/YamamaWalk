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
        CustomTextField(hint: "email", value: $vm.email)
        CustomTextField(hint: "pin", value: $vm.pin)
        
        PrimaryButton(title: "Login") {
            Task { try await vm.login() }
        }
    }
}

#Preview {
    LoginFormView(vm: LoginVM())
}
