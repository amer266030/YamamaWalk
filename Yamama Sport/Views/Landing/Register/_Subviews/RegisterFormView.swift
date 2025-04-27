//
//  RegisterFormView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct RegisterFormView: View {
    @ObservedObject var vm: RegisterVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                CustomTextField(hint: "name", value: $vm.name)
                CustomTextField(hint: "email", value: $vm.email, type: .email) { isValid in
                    vm.isEmailValid = isValid
                }
                CustomTextField(hint: "password", value: $vm.password, characterLimit: 12)
                Text("Use a 9 character password with a mix of letters, numbers and symbols")
                    .lineLimit(2, reservesSpace: true)
                    .font(.footnote)
                    .foregroundStyle(.bg)
                
                SegmentedTabView(selectedTab: $vm.gender)
                
                CustomTextField(hint: "5* *** ****", value: $vm.phone, type: .phone, characterLimit: 9) { isValid in
                    
                }
            }
            
            HStack(alignment: .firstTextBaseline) {
                AnimatedButton {
                    vm.didAgreeToTerms.toggle()
                } label: {
                    Image(systemName: vm.didAgreeToTerms ? "checkmark.square" : "square.fill")
                        .foregroundStyle(.white)
                }
                Text("By signing up, you agree to Terms of Use and Privacy Policy.")
            }
            .lineLimit(2, reservesSpace: true)
            .font(.footnote)
            .foregroundStyle(.bg)
            
            HStack {
                PrimaryButton(title: "Register") {
                    Task { try await vm.register() }
                }
            }
        }
    }
}

//#Preview {
//    RegisterFormView(vm: RegisterVM())
//}
