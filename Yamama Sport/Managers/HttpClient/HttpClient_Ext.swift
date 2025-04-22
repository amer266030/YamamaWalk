//
//  HttpClient_Ext.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

extension HTTPClient {
    func resourceDebugPrint<T: Codable>(_ resource: Resource<T>) {
        #if DEBUG
                print(
            """
            ----------
            * Resource Details:
            - URL: \(resource.url)
            - METHOD: \(resource.method)
            - HEADERS: \(resource.headers)
            - MODEL TYPE: \(resource.modelType)
            """
                )
        #endif
    }
    
    func paramsDebugPrint(data: Data?) {
        #if DEBUG
        if let data {
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print("- REQUEST PARAMS: \(json)")
            } else {
                print("- PARAMS: Unable to convert data to dictionary")
                print(String(data: data, encoding: .utf8) ?? "Raw Data Unreadable")
            }
        } else {
            print("- NO PARAMS DETECTED")
        }
        #endif
    }
    
    func responseDebugPrint(statusCode: Int, data: Data) {
        #if DEBUG
        print("- STATUS CODE: \(statusCode)")
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
           let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyString = String(data: prettyData, encoding: .utf8) {
            print("- RESPONSE:\n\(prettyString)")
        } else {
            print("- RESPONSE: Unable to convert data to dictionary")
            print(String(data: data, encoding: .utf8) ?? "Raw Data Unreadable")
        }
        #endif
    }
}
