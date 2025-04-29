//
//  LogoView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct LogoView: View {
    var padding: CGFloat = 80
    
    var body: some View {
        Image(.yamamaCement)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(padding)
    }
}

#Preview {
    LogoView()
}
