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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isTapped = false
                action()
            }
        }) {
            label()
                .scaleEffect(isTapped ? 0.85 : 1.0)
                .animation(.bouncy(duration: 0.3, extraBounce: 0.2), value: isTapped)
        }
    }
}
