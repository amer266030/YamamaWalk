//
//  HomeVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class HomeVM: ObservableObject {
    private let x = DIContainer.shared
    
    @Published var user = User()
    
    @Published var dob: Date = .now
    @Published var gender: Gender = .male
    
    init() {
        if x.appMgr.isPreview { user = x.mockData.currentUser ?? User() }
        else { user = x.appMgr.currentUser ?? User() }
        dob = user.dob ?? .now
        gender = user.gender ?? .male
    }
    
    @MainActor
    func updateSteps() async {
        x.popupMgr.showLoading()
//        defer { x.popupMgr.dismissLoading() }
        
        // Get Steps from Health App
        
    }
    
}
