//
//  Keyboard_Ext.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import SwiftUI

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
