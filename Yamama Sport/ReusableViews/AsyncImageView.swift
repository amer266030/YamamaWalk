//
//  AsyncImageView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 23/04/2025.
//

import SwiftUI

struct AsyncImageView: View {
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url) { img in
            
        } placeholder: {
            Image(systemName: "person")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(.white)
                .padding()
                .background {
                    Circle()
                        .stroke(.bg, lineWidth: 2)
                }
                .padding(4)
                .background(.appSecondary, in: .circle)
        }
    }
}

#Preview {
    AsyncImageView()
}
