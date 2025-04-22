//
//  PopupMgr_Ext.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

extension PopupMgr {
    @MainActor
    func showAppAlert(for alert: AppAlertProtocol, canDismissAlert: Bool = true) {
        showAppAlert(
            iconName: alert.iconName,
            iconColor: alert.iconColor,
            title: alert.title,
            msg: alert.message,
            secondaryBtnTitle: alert.secondaryBtnTitle,
            secondaryBtnAction: alert.secondaryBtnAction,
            primaryBtnTitle: alert.primaryBtnTitle,
            primaryBtnAction: alert.primaryBtnAction,
            canDismissAlert: canDismissAlert
        )
    }
    
    @MainActor
    private func showAppAlert(
        iconName: String = "info.circle",
        iconColor: Color = .red,
        title: String = "Error",
        msg: String,
        attributedMsg: AttributedString? = nil,
        secondaryBtnTitle: String? = nil,
        secondaryBtnAction: (() -> Void)? = nil,
        primaryBtnTitle: String? = "Continue",
        primaryBtnAction: (() -> Void)? = nil,
        primaryBtnForegroundColor: Color = .white,
        canDismissAlert: Bool = true
    ) {
        isLoading = false
        alertIconName = iconName
        alertIconColor = iconColor
        alertTitle = title
        alertMsg = msg
        alertSecondaryBtnTitle = secondaryBtnTitle
        alertSecondaryBtnAction = secondaryBtnAction
        alertPrimaryBtnTitle = primaryBtnTitle
        alertPrimaryBtnAction = primaryBtnAction
        alertCanBeDismissed = canDismissAlert
        isAlertVisible = true
    }
    
    @MainActor
    func dismissAppAlert() {
        alertIconName = "info.circle"
        alertIconColor = .red
        alertTitle = ""
        alertMsg = ""
        alertSecondaryBtnTitle = nil
        alertSecondaryBtnAction = nil
        alertPrimaryBtnTitle = nil
        alertPrimaryBtnAction = nil
        alertCanBeDismissed = true
        isAlertVisible = false
    }
}
