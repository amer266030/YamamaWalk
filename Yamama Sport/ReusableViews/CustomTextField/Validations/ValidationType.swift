//
//  ValidationType.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

enum ValidationsType {
    // text fields
    case email(_ value: String)
    case phone(_ value: String)
    case nonEmpty(_ value: String)
    case none
}
