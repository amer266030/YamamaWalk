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
                HStack {
                    LanguageButton()
                    Spacer()
                }
                CustomTextField(hint: "name", value: $vm.name)
                CustomTextField(hint: "email", value: $vm.email, type: .email, hintIcon: "envelope.fill") { isValid in
                    vm.isEmailValid = isValid
                }
                
                CustomTextField(hint: "5* *** ****", value: $vm.phone, type: .phone, characterLimit: 9, hintIcon: "phone.fill") { isValid in
                    
                }
                
                CustomTextField(hint: "password", value: $vm.password, type: .pwd, characterLimit: 12, hintIcon: "lock.fill")
                
                Text("Use an 8 character password with a mix of letters, numbers and symbols")
                    .lineLimit(2, reservesSpace: true)
                    .font(.footnote)
                    .foregroundStyle(.bg)
            
                Menu {
                    ForEach(Department.allCases) { dept in
                        Button(dept.strValue) {
                            vm.department = dept
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "square.grid.2x2.fill")
                        Text(vm.department.strValue)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .foregroundStyle(.black)
                    .padding()
                    .background(.white, in: .rect(cornerRadius: 16))
                }
                SegmentedTabView(selectedTab: $vm.gender)
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
