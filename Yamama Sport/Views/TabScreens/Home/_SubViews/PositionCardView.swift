//
//  PositionCardView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct PositionCardView: View {
    var title: String
    var position: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(LinearGradient.primary)
            .aspectRatio(1.5, contentMode: .fit)
            .overlay {
                VStack(spacing: 16) {
                    Text(title)
                        .font(.headline)
                        .lineLimit(2, reservesSpace: true)
                    
                    Image(systemName: "medal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 40)
                    
                    Text(position)
                        .font(.title)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                .padding()
                .foregroundStyle(.bg)
            }
    }
}

#Preview {
    PositionCardView(title: "lorem ipsum", position: "First")
}
