//
//  DIContainer.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

import Foundation

class DIContainer {
    
    static let shared = DIContainer()
    
    private init() {}
    
    lazy var appMgr = AppMgr.shared
    lazy var navMgr = NavMgr.shared
    lazy var popupMgr = PopupMgr.shared
    lazy var mockData = MockData.shared
}
