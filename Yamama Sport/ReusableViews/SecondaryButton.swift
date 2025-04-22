//
//  SecondaryButton.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct SecondaryButton: View {
    var title: LocalizedStringKey
    var animation: Animation = .easeOut(duration: 0.5)
    var action: () -> Void
    
    var body: some View {
        Button {
            withAnimation(animation) { action() }
        } label: {
            HStack {
                HStack {
                    Text(title)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                }
                .padding()
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(Color.clear, in: .rect(cornerRadius: 8))
        }
    }
    
}

#Preview {
    SecondaryButton(title: "Secondary") {}
        .padding()
}
