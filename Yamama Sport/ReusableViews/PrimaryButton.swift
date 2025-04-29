//
//  PrimaryButton.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct PrimaryButton: View {
    var title: LocalizedStringKey
    var animation: Animation = .easeOut(duration: 0.5)
    var foregroundColor: Color = .white
    var backgroundColor: AnyGradient = Color.indigo.gradient
    var action: () -> Void
    
    var body: some View {
        Button {
            withAnimation(animation) { action() }
        } label: {
            HStack {
                HStack {
                    Text(title)
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                }
                .padding()
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(foregroundColor)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(backgroundColor)
            }
        }
    }
    
}

#Preview {
    PrimaryButton(title: "Primary") {}
        .padding()
}
