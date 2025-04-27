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
    
    var hint: LocalizedStringKey
    @Binding var value: String
    
    var symbolColor: Color = .red
    var canEdit = true
    var type: TextFieldType = .standard
    var characterLimit: Int?
    
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
                if type == .phone {
                    Text("+966")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                }
                
                ZStack {
                    TextField(hint, text: $value)
                        .textFieldStyle(.plain)
                        .keyboardType(type.keyboardType)
                        .autocapitalization(.none)
                        .onChange(of: value) {
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
                }
            }
            .allowsHitTesting(canEdit)
            .foregroundStyle(.appPrimary)
            .padding()
            .background(.bg, in: .rect(cornerRadius: 8))
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
