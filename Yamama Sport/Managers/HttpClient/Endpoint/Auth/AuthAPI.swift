//
//  AuthAPI.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct AuthAPI {
    private static let appMgr = AppMgr.shared
    private static let baseURL = ""
    private static let httpClient = HTTPClient()

    private static func buildURL(path: AuthPathParam) -> URL? {
        return URL(string: "\(baseURL)/\(path.path)")
    }

    static func sendRequest<T: Codable, U: Codable>(to path: AuthPathParam, body: T) async throws -> U {
        
        guard let url = buildURL(path: path) else {
            throw NetworkError.badRequest
        }
        
        let requestData = try JSONEncoder().encode(body)
        
        let requestHeaders = [
            "Content-Type": "application/json",
            "lang": "en",
            "token": appMgr.getAccessToken(),
        ]
        
        let resource = Resource(url: url, method: .post(requestData), headers: requestHeaders, modelType: U.self)
        
        return try await httpClient.load(resource)
    }
}

