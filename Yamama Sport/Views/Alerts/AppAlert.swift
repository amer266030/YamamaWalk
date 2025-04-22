//
//  AppAlert.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

enum AppAlert: AppAlertProtocol {
    case invalidPin
    case authError(AuthError)
    case httpError(NetworkError)
    case unexpected(Error)
    case profileUpdated
    
    
    var iconName: String { "info.rectangle" }
    var iconColor: Color {
        switch self {
        case .profileUpdated: return .appPrimary
        default: return .red
        }
    }

    var title: String {
        switch self {
        case .invalidPin:
            return "Invalid Pin"
        case .authError:
            return "Auth Error"
        case .httpError:
            return "Netowrk Error"
        case .unexpected:
            return "Unexpeted Error"
        case .profileUpdated:
            return "Profile Updated"
        }
    }
    var titleColor: Color { .red }

    var message: String {
        switch self {
        case .invalidPin:
            return "Please make sure you entered the correct pin."
        case .authError(let error):
            return error.localizedDescription
        case .httpError(let error):
            return error.localizedDescription
        case .unexpected(let error):
            return error.localizedDescription
        case .profileUpdated:
            return "Your profile has been updated successfully."
        }
    }
    
    var primaryBtnTitle: String { "OK" }
    var primaryBtnAction: (() -> Void)? { nil }
    var secondaryBtnTitle: String? { nil }
    var secondaryBtnAction: (() -> Void)? { nil }
}
