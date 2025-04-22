//
//  ProfileVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class ProfileVM: ObservableObject {
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
    func updateUser() async {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            let request = UpdateProfileRequest(img: nil, dob: dob, gender: gender)
            let response : UpdateProfileResponse = try await ProfileAPI.sendRequest(to: .updateProfile(UpdateProfileRequest.self), body: request)
            
            x.appMgr.currentUser = response
            x.popupMgr.showAppAlert(for: AppAlert.profileUpdated)
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError { x.navMgr.push(.tabBar) } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
}
