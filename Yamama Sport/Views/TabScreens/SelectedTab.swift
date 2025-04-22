//
//  SelectedTab.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

enum SelectedTab: String, CaseIterable, Identifiable {
    case profile, home, ranking
    
    var id: String { self.rawValue }

    var title: LocalizedStringKey {
        switch self {
        case .profile: return "Profile"
        case .home: return "Home"
        case .ranking: return "Ranking"
        }
    }
    
    var icon: String {
        switch self {
        case .profile: return "person"
        case .home: return "house"
        case .ranking: return "medal"
      
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .profile:
            ProfileView()
        case .home:
            HomeView()
        case .ranking:
            RankingView()
        }
    }
}
