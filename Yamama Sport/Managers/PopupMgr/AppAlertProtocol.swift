//
//  AppAlertProtocol.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

protocol AppAlertProtocol {
    var iconName: String { get }
    var iconColor: Color { get }
    var title: String { get }
    var message: String { get }
    var primaryBtnTitle: String { get }
    var primaryBtnAction: (() -> Void)? { get }
    var secondaryBtnTitle: String? { get }
    var secondaryBtnAction: (() -> Void)? { get }
}
