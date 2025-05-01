//
//  StepsAPI.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct StepsAPI {
    private static let appMgr = AppMgr.shared
    private static let apiVersion = "/api/v1"
    private static let httpClient = HTTPClient()
    private static let baseURL = "https://kadi-odyssey.com\(apiVersion)"
    
    static func createQueryItems(_ params: [StepsQueryParam: String]) -> [URLQueryItem] {
        return params.map { URLQueryItem(name: $0.key.rawValue, value: $0.value) }
    }
    
    private static func buildURL(path: StepsPathParam) -> URL? {
        return URL(string: "\(baseURL)/\(path.path)")
    }
    
    static func sendRequest<T: Codable, U: Codable>(to path: StepsPathParam, body: T? = nil, with queryParams: [URLQueryItem] = []) async throws -> U {
        
        guard let url = buildURL(path: path) else {
            throw NetworkError.badRequest
        }
        
        let requestHeaders = [
            "Content-Type": "application/json",
            "lang": "en",
            "Authorization": appMgr.getAccessToken(),
        ]
        
        let resource: Resource<U>
        
        if path.isPostRequest {
            let requestData = try JSONEncoder().encode(body)
            resource = Resource(url: url, method: .post(requestData), headers: requestHeaders, modelType: U.self)
        } else {
            resource = Resource(url: url, method: .get(queryParams), headers: requestHeaders, modelType: U.self)
        }
        
        return try await httpClient.load(resource)
    }
    
}
