//
//  HttpClientProtocol.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation
protocol HTTPClientProtocol {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T
}
