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
        VStack {
            Grid {
                GridRow {
                    Text("")
                        .gridCellColumns(1)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(user.name ?? "")
                                .font(.headline)
                                .lineLimit(1)
                                .fontWidth(.compressed)
                            Spacer()
                        }
                        customDivider()
                    }
                    .gridCellColumns(6)
                }
                GridRow {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.bg)
                        .padding()
                        .background(LinearGradient.primary, in: .circle)
                        .gridCellColumns(1)
                    
                    HStack {
                        VStack {
                            Text("Steps Count")
                                .lineLimit(2, reservesSpace: true)
                            Text("200")
                        }
                        .frame(maxWidth: .infinity)
                        
                        customDivider()
                        
                        VStack {
                            Text("Department")
                                .lineLimit(2, reservesSpace: true)
                            Text("\(user.department ?? "")")
                        }
                        .frame(maxWidth: .infinity)
                        
                        customDivider()
                    }
                    .gridCellColumns(6)
                    
                    HStack {
                        
                        VStack {
                            Text("Fourth Position")
                                .lineLimit(2, reservesSpace: true)
                            Text("")
                        }
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .font(.title)
                            .foregroundStyle(.yellow.gradient)
                    }
                    .gridCellColumns(3)
                }
            }
            customDivider(height: 5)
        }
        .font(.caption)
        .foregroundStyle(.appPrimary)
        .aspectRatio(3, contentMode: .fit)
    }
}

fileprivate func customDivider(height: CGFloat = 2) -> some View {
    Divider()
        .frame(minWidth: height, minHeight: height)
        .background(Color.appPrimary)
}

#Preview {
    UserRankCardView(user: MockData.shared.currentUser ?? User())
        .padding()
}
