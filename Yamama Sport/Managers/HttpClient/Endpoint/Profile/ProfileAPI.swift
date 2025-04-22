//
//  ProfileAPI.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

import Foundation

struct ProfileAPI {
    private static let appMgr = AppMgr.shared
    static let baseURL = ""
    private static let httpClient = HTTPClient()
    
    static func createQueryItems(_ params: [ProfileQueryParam: String]) -> [URLQueryItem] {
        return params.map { URLQueryItem(name: $0.key.rawValue, value: $0.value) }
    }
    
    static func buildURL(path: ProfilePathParam? = nil, queryParams: [URLQueryItem] = []) -> URL? {
        var urlString = baseURL
        if let path = path {
            urlString += "/\(path.path)"
        }

        var components = URLComponents(string: urlString)
        
        if !queryParams.isEmpty {
            components?.queryItems = queryParams
        }

        return components?.url
    }
    
    static func sendRequest<T: Codable, U: Codable>(to path: ProfilePathParam, body: T, with queryParams: [URLQueryItem] = []) async throws -> U {
        
        guard let url = buildURL(path: path, queryParams: queryParams) else {
            throw NetworkError.badRequest
        }
        
        let requestHeaders = [
            "Content-Type": "application/json",
            "lang": "en",
            "token": appMgr.getAccessToken(),
        ]
        
        let requestData = try JSONEncoder().encode(body)
        let resource = Resource(url: url, method: .post(requestData), headers: requestHeaders, modelType: U.self)
        
        return try await httpClient.load(resource)
    }
}
