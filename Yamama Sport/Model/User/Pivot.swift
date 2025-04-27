//
//  Pivot.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct Pivot: Codable {
    let modelId: Int
    let modelType: String
    let roleId: Int

    enum CodingKeys: String, CodingKey {
        case modelId = "model_id"
        case modelType = "model_type"
        case roleId = "role_id"
    }
}
