//
//  ArticleViewModel.swift
//  HackerNews
//
//  Created by Varshith Chilamkurthi on 25/06/24.
//

import Foundation

class ArticleViewModel {
    var articles: [Article] = []
    
    func fetchData() async throws -> () {
        if let data = try await ApiManager.sharedInstance.getApiData() {
            if let decodedData = decodeData(data: data) {
                articles = decodedData
                print(articles)
            }
        }
    }
    
    func decodeData(data: Data) -> [Article]? {
        do {
            let decodedData = try JSONDecoder().decode(News.self, from: data)
            return decodedData.hits
        } catch {
            print("not decoded")
            return []
        }
    }
}
