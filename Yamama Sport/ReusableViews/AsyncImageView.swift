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
        AnimatedButton {
            
        } label: {
            AsyncImage(url: url) { img in
                
            } placeholder: {
                let gender = AppMgr.shared.currentUser?.gender ?? .male
                Image(systemName: gender.imgStr)
                    .font(.system(size: 56))
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
}

#Preview {
    AsyncImageView()
}
