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
    
    @MainActor
    func logout() async {
        do {
            let request = LogoutRequest()
            let _: LogoutResponse = try await AuthAPI.sendRequest(to: .logout(LogoutRequest.self), body: request)
            
            x.appMgr.currentUser = nil
            x.navMgr.reset()
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError { x.navMgr.reset() } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
}
