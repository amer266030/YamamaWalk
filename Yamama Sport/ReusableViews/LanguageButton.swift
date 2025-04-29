//
//  LanguageButton.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 29/04/2025.
//

import SwiftUI

struct LanguageButton: View {
    @AppStorage("isEnglish") var isEnglish: Bool = true
    var titleColor: Color = .white
    
    var body: some View {
        HStack {
            AnimatedButton {
                isEnglish.toggle()
            } label: {
                Image(isEnglish ? .english : .arabic)
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            Text(isEnglish ? "En" : "Ar")
        }
        .foregroundStyle(titleColor)
        .environment(\.layoutDirection, .leftToRight)
    }
}

#Preview {
    LanguageButton()
}
