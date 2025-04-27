//
//  EventPathParam.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

enum EventPathParam {
    case events

    var path: String {
        switch self {
        case .events:
            return "events"
        }
    }
}
