//
//  HttpClient.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

struct HTTPClient: HTTPClientProtocol {
    
    private let session: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        self.session = URLSession(configuration: configuration)
    }

    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        do {
            guard !AppMgr.shared.isPreview else {
                throw NetworkError.simulatorError
            }
            return try await sendRequest(resource)
        } catch {
            throw error
        }
    }

    private func sendRequest<T: Codable>(_ resource: Resource<T>) async throws -> T {
        // Debug Print
        resourceDebugPrint(resource)
        
        var request = URLRequest(url: resource.url)

        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else { throw NetworkError.badRequest }
            request.url = url
        case .post(let data), .put(let data):
            // Debug Print
            paramsDebugPrint(data: data)
            
            request.httpMethod = resource.method.name
            request.httpBody = data
        case .delete:
            request.httpMethod = resource.method.name
        }

        for (key, value) in resource.headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        let statusCode = httpResponse.statusCode
        // Debug Print
        responseDebugPrint(statusCode: statusCode, data: data)

        let result = try JSONDecoder().decode(Results<T>.self, from: data)
        
        guard (200...299).contains(statusCode) else {
            if let errorResponse = result.errors {
                throw NetworkError.errorResponse(errorResponse)
            } else {
                throw NetworkError.invalidResponse
            }
        }

        guard let extractedData = result.data else {
            throw NetworkError.decodingError(NSError(domain: "No data field found in response", code: -1))
        }

        return extractedData
    }
}
