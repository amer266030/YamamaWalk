//
//  EventAPI.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct EventAPI {
    private static let appMgr = AppMgr.shared
    private static let apiVersion = "/api/v1"
    private static let httpClient = HTTPClient()
    private static let baseURL = "https://kadi-odyssey.com\(apiVersion)"
    
    static func buildURL(path: EventPathParam? = nil) -> URL? {
        var urlString = baseURL
        if let path = path {
            urlString += "/\(path.path)"
        }
        var components = URLComponents(string: urlString)
        return components?.url
    }
    
    static func sendRequest<U: Codable>(to path: EventPathParam) async throws -> U {
        
        guard let url = buildURL(path: path) else {
            throw NetworkError.badRequest
        }
        
        let requestHeaders = [
            "Content-Type": "application/json",
            "lang": "en",
            "token": appMgr.getAccessToken(),
        ]
        
        let resource = Resource(url: url, method: .get([]), headers: requestHeaders, modelType: U.self)
        
        return try await httpClient.load(resource)
    }
}
