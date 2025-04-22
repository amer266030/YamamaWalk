//
//  LoginVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class LoginVM: ObservableObject {
    private let x = DIContainer.shared
    
    var email: String = ""
    var pin: String = ""
    
    @MainActor
    func login() async throws {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            guard !email.isEmpty else { throw AuthError.invalidEmail }
            guard pin.count == 6 else { throw AuthError.invalidPin }
            
            let request = LoginRequest(email: email, pin: pin)
            let response: LoginResponse = try await AuthAPI.sendRequest(to: .login(LoginRequest.self), body: request)
            
            guard let accessToken = response.accessToken else { throw AuthError.missingAccessToken }
            
            x.appMgr.storeAccessToken(accessToken)
            x.appMgr.currentUser = response
            
            x.navMgr.push(.tabBar)
        } catch let error as AuthError {
            x.popupMgr.showAppAlert(for: AppAlert.authError(error))
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError { x.navMgr.push(.tabBar) } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
    
    @MainActor
    func navigateToRegister() {
        x.navMgr.replaceWith(.register)
    }
}
