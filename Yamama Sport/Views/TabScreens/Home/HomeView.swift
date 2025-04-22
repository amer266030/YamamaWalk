//
//  HomeView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeVM()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 32) {
            LazyVGrid(columns: createGridItems(2), spacing: 16) {
                StepsCardView(title: "Steps in the past 6 days", steps: 2000)
                StepsCardView(title: "Steps in the past 6 days", steps: 2000)
            }
            PositionCardView(title: "Your position compared to your colleagues", position: "Fourth")
        }
    }
    
    fileprivate func createGridItems(_ numItems: Int) -> [GridItem] {
        let columns = [GridItem](repeating: GridItem(.flexible(), spacing: 16), count: numItems)
        return columns
    }
}

//#Preview {
//    HomeView()
//}
