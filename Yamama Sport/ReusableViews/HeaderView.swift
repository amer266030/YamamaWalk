//
//  HeaderView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct HeaderView: View {
    var title: LocalizedStringKey
    var action: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
            
            Spacer()
            
            Menu {
                Button {
                    action()
                } label: {
                    Text("Logout")
                }
            } label: {
                Image(systemName: "line.3.horizontal")
            }
        }
        .font(.headline)
        .foregroundStyle(.appSecondary)
    }
}
