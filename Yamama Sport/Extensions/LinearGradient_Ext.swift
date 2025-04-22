//
//  LinearGradient_Ext.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

extension LinearGradient {
    static let primary: LinearGradient = .init(
        gradient: Gradient(colors: [Color.appPrimary, Color.appSecondary]),
        startPoint: .bottom,
        endPoint: .top
    )
}
