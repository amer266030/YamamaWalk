//
//  AnimatedButton.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct AnimatedButton<Content: View>: View {
    @State private var isTapped = false
    
    let action: () -> Void
    let label: () -> Content
    
    var body: some View {
        Button(action: {
            isTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isTapped = false
                action()
            }
        }) {
            label()
                .scaleEffect(isTapped ? 0.85 : 1.0)
                .animation(.bouncy(duration: 0.2, extraBounce: 0.1), value: isTapped)
        }
    }
}
