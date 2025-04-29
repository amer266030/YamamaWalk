//
//  RegisterVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class RegisterVM: ObservableObject {
    private let x = DIContainer.shared
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var gender: Gender = .male
    @Published var phone: String = ""
    @Published var department: Department = .headOffice
    
    @Published var isEmailValid = false
    @Published var didAgreeToTerms = false
    
    @MainActor
    func register() async throws {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        do {
            guard !name.isEmpty else { throw AuthError.nameRequired }
            guard isEmailValid else { throw AuthError.invalidEmail }
            guard password.count > 7 else { throw AuthError.invalidPin }
            guard didAgreeToTerms else { throw AuthError.mustAgreeToTerms }
            
            let request = RegisterRequest(name: name, email: email, password: password, gender: gender, phone: phone)
            let response: RegisterResponse = try await AuthAPI.sendRequest(to: .register(RegisterRequest.self), body: request)
            
            guard let accessToken = response.token else { throw AuthError.missingAccessToken }
            
            x.appMgr.storeAccessToken(accessToken)
            x.appMgr.currentUser = response.user
            x.appMgr.department = self.department
            
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
