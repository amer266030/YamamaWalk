//
//  AppMgr.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI
import KeychainSwift

final class AppMgr {
    private let keychain = KeychainSwift()
    var isPreview: Bool = false
    var currentUser: User?
    
    static let shared = AppMgr()
    
    private init() {
//        isPreview = true
        isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    func storeAccessToken(_ accessToken: String) {
        keychain.set(accessToken, forKey: UserKeys.accessToken)
    }
    
    func getAccessToken() -> String {
        keychain.get(UserKeys.accessToken) as String? ?? ""
    }
}
