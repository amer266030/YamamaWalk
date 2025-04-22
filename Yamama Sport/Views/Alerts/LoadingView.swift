//
//  LoadingView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

import SwiftUI

struct LoadingView: View {
    @Binding var msg: String
    
    var body: some View {
        ProgressView(msg)
            .tint(.appPrimary)
            .controlSize(.large)
            .padding(24)
            .background(.white.gradient, in: .rect(cornerRadius: 16))
            .shadow(radius: 1)
            .padding(32)
    }
}

#Preview {
    LoadingView(msg: .constant("Loading with a long message that goes over more than one line"))
}
