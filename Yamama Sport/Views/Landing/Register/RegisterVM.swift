//
//  RegisterVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class RegisterVM: ObservableObject {
    private let x = DIContainer.shared
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var pin: String = ""
    
    @Published var isEmailValid = false
    @Published var didAgreeToTerms = false
    
    @MainActor
    func register() async throws {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            guard !firstName.isEmpty else { throw AuthError.firstNameRequired }
            guard !lastName.isEmpty else { throw AuthError.lastNameRequired }
            guard isEmailValid else { throw AuthError.invalidEmail }
            guard pin.count == 6 else { throw AuthError.invalidPin }
            guard didAgreeToTerms else { throw AuthError.mustAgreeToTerms }
            
            let request = RegisterRequest(firstName: firstName, lastName: lastName, email: email, pin: pin)
            let response: RegisterResponse = try await AuthAPI.sendRequest(to: .register(RegisterRequest.self), body: request)
            
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
    func navigateToLogin() {
        x.navMgr.replaceWith(.login)
    }
}
