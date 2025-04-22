//
//  RankingVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class RankingVM: ObservableObject {
    private let x = DIContainer.shared
    
    @Published var timeRemaining = 36000
    @Published var allUsers: [User] = []
    
    @MainActor
    func getUsers() async {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            let request =  GetUsersRequest()
            let response: GetUsersResponse = try await ProfileAPI.sendRequest(to: .getUsers(GetUsersRequest.self), body: request)
            
            allUsers = response.allUsers ?? []
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError { allUsers = x.mockData.allUsers } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
}
