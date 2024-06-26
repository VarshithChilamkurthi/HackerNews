//
//  ApiManager.swift
//  HackerNews
//
//  Created by Varshith Chilamkurthi on 25/06/24.
//

import Foundation

class ApiManager {
    static let sharedInstance = ApiManager()
    private init() {}
    
    func getApiData() async throws -> Data? {
        let url = URL(string: Constants.serverUrl.rawValue)
        if let url = url {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }
        return nil
    }
}
