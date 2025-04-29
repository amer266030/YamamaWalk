//
//  CustomTextField.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct CustomTextField: View {
    @State private var showError = false
    @State private var errorMessage: String?
    
    @State private var showPwd = false
    
    var hint: LocalizedStringKey
    @Binding var value: String
    
    var symbolColor: Color = .red
    var canEdit = true
    var type: TextFieldType = .standard
    var characterLimit: Int?
    
    var hintIcon: String = "pencil"
    
    var onValidate: ((Bool) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Error Message
            if let errorMessage {
                Text("* \(errorMessage)")
                    .font(.caption)
                    .foregroundStyle(symbolColor)
            }
            
            // MARK: - TextField
            HStack(alignment: .firstTextBaseline) {
                
                Image(systemName: hintIcon)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.text)
                
//                if type == .phone {
//                    Text("+966")
//                        .font(.subheadline)
//                        .foregroundStyle(.black)
//                }
                
                ZStack {
                    Group {
                        if type == .pwd {
                            SecureField(hint, text: $value)
                        } else {
                            TextField(hint, text: $value)
                        }
                    }
                    .textFieldStyle(.plain)
                    .keyboardType(type.keyboardType)
                    .autocapitalization(.none)
                    .onChange(of: value) { _ in
                        if let limit = characterLimit, value.count > limit {
                            value = String(value.prefix(limit))
                        }
                        validateField(value)
                    }
                    
                    // MARK: - Error indicator overlay
                    if showError {
                        HStack {
                            Spacer()
                            Image(systemName: "exclamationmark.circle")
                                .foregroundStyle(symbolColor)
                        }
                        .padding(4)
                        .environment(\.layoutDirection, .leftToRight)
                    }
                    
                    if type == .pwd {
                        HStack {
                            Spacer()
                            Button {
                                showPwd.toggle()
                            } label: {
                                Image(systemName: showPwd ? "eye.fill" : "eye.slash.fill")
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding(4)
                    }
                }
            }
            .allowsHitTesting(canEdit)
            .foregroundStyle(.appPrimary)
            .padding()
            .background(.bg, in: .rect(cornerRadius: 16))
        }
    }
    
    @MainActor
    private func validateField(_ newValue: String) {
        errorMessage = type.validate(value: newValue)
        showError = (errorMessage != nil)
        let isValid = errorMessage == nil
        onValidate?(isValid)
    }
}

#Preview {
    ZStack {
        CustomTextField(hint: "Hint", value: .constant("2.25"), canEdit: false, type: .phone)
            .padding()
    }
}
