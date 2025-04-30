//
//  AppMgr.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI
import KeychainSwift

final class AppMgr {
    // MARK: - Auth
    @AppStorage("email") var email: String = ""
    @AppStorage("pwd") var pwd: String = ""
    @AppStorage("dept") var department: Department = .headOffice
    
    private let keychain = KeychainSwift()
    var isPreview: Bool = false
    var currentUser: User?
    
    static let shared = AppMgr()
    
    private init() {
//        isPreview = true
        isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    func storeAccessToken(_ accessToken: String) {
        let bearer = "Bearer \(accessToken)"
        keychain.set(bearer, forKey: UserKeys.accessToken)
    }
    
    func getAccessToken() -> String {
        keychain.get(UserKeys.accessToken) as String? ?? ""
    }
    
    func saveCredentials(email: String, pwd: String) {
        self.email = email
        self.pwd = pwd
    }
    
    func resetCredentials() {
        self.email = ""
        self.pwd = ""
        self.currentUser = nil
    }
}
