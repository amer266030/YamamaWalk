//
//  StepsCardView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct StepsCardView: View {
    var title: LocalizedStringKey
    @Binding var steps: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.headline)
                .lineLimit(2, reservesSpace: true)
            
            Image(systemName: "figure.run")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 32)
            
            Text("\(steps)")
                .font(.title)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }
        .foregroundStyle(.bg)
        .padding()
        .background(LinearGradient.primary, in: .rect(cornerRadius: 16))
    }
}

//#Preview {
//    StepsCardView(title: "Steps in past 6 days", steps: 13030)
//}
