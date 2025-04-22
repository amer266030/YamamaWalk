//
//  LogoView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image(.yamamaCement)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(80)
    }
}

#Preview {
    LogoView()
}
