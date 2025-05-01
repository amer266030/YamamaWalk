//
//  TabScreenVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

class TabScreenVM: ObservableObject {
    @ObservedObject private var navMgr = NavMgr.shared
    private let x = DIContainer.shared
    
    var selectedTab: SelectedTab {
        get { navMgr.selectedTab }
        set { navMgr.selectedTab = newValue }
    }
    
    @MainActor
    func selectTab(_ tab: SelectedTab) async {
        if tab != selectedTab { selectedTab = tab }
    }
    
}
