//
//  HeaderView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct HeaderView: View {
    var title: LocalizedStringKey
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
            
            Spacer()
            
            LanguageButton(titleColor: .black)
        }
        .font(.headline)
        .foregroundStyle(.appSecondary)
    }
}
