//
//  StepsPathParam.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

enum StepsPathParam {
    case addSteps
    case getRanking
    
    var path: String {
        switch self {
        case .addSteps:
            return "steps-counters"
        case .getRanking:
            return "steps-counters/rank"
        }
    }
    
    var isPostRequest: Bool {
        switch self {
        case .addSteps: true
        case .getRanking: false
        }
    }
}
