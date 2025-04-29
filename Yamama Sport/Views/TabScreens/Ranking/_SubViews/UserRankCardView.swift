//
//  UserRankCardView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 23/04/2025.
//

import SwiftUI

struct UserRankCardView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.bg)
                    .padding()
                    .background(LinearGradient.primary, in: .circle)
                    .gridCellColumns(1)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(user.name ?? "")
                        .lineLimit(1)
                        .font(.headline)
                        .fontWidth(.compressed)
                        .foregroundStyle(.appPrimary)
                    
                    Divider()
                        .frame(width: 60, height: 2)
                        .background(Color.appPrimary)
                }
                Spacer()
            }
            // Info Items
            HStack {
                infoItemView(title: "Steps Count", value: "200")
                Divider()
                    .frame(width: 2, height: 40)
                    .background(.gray.opacity(0.2))
                infoItemView(title: "Department", value: Department.factory.strValue)
                Divider()
                    .frame(width: 2, height: 40)
                    .background(.gray.opacity(0.2))
                infoItemView(title: "Position", value: "5th")
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    .white
                        .shadow(.inner(color: .black.opacity(0.5), radius: 2, x: 0, y: -2))
                        .shadow(.drop(color: .black.opacity(0.2), radius: 3, x: 0, y: 2))
                )
            
            
        }
        
    }
}

fileprivate func infoItemView(title: LocalizedStringKey, value: LocalizedStringKey) -> some View {
    VStack {
        Text(title)
            .font(.caption)
            .foregroundStyle(.gray)
            .lineLimit(1)
            
        Text(value)
            .font(.footnote)
            .bold()
            .foregroundStyle(.appPrimary)
            .lineLimit(1)
    }
    .frame(maxWidth: .infinity)
}

#Preview {
    let x = DIContainer.shared
    
    UserRankCardView(user: x.mockData.currentUser ?? User())
        .padding()
}
