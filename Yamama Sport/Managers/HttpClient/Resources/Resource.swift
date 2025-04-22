//
//  Resource.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct Resource<T: Codable> {
    var url: URL
    var method: HTTPMethod = .get([])
    var headers: [String: String] = [:]
    var modelType: T.Type
}
