//
//  TabItemProtocol.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation
import SwiftUI

protocol TabItemProtocol: CaseIterable, Identifiable, Hashable where AllCases: RandomAccessCollection {
//    var strValue: String { get }
    var strValue: LocalizedStringKey { get }
}
