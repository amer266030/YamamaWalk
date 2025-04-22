//
//  PopupMgr.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

class PopupMgr: ObservableObject {
    static let shared = PopupMgr()
    
    @Published var isLoading = false
    @Published var isAlertVisible = false
    
    var isPopupVisible: Bool {
        isLoading || isAlertVisible
    }
    
    @Published var loadingMsg: String = ""
    
    // Icon
    @Published var alertIconName: String = "info.circle"
    @Published var alertIconColor: Color = .red
    // Title
    @Published var alertTitle: String = ""
    // Msg
    @Published var alertMsg: String = ""
    // Buttons
    @Published var alertSecondaryBtnTitle: String?
    @Published var alertSecondaryBtnAction: (() -> Void)?
    @Published var alertPrimaryBtnTitle: String?
    @Published var alertPrimaryBtnAction: (() -> Void)?
    // Persistant
    @Published var alertCanBeDismissed: Bool = true
    
    private init() {
        
    }
    
    @MainActor
    func showLoading(_ msg: String = "Loading...") {
        loadingMsg = msg
        if !isLoading {
            isLoading = true
        }
    }
    
    @MainActor
    func dismissLoading() {
        isLoading = false
    }
    
}
