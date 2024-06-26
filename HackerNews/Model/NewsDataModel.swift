//
//  NewsDataModel.swift
//  HackerNews
//
//  Created by Varshith Chilamkurthi on 25/06/24.
//

import Foundation

struct News: Codable {
    let hits: [Article]?
}

struct Article: Codable {
    let _highlightResult: HighlightResult?
}

struct HighlightResult: Codable {
    let author: Author?
    let title: Title?
    let url: Url?
}

struct Author: Codable {
    let value: String?
}

struct Title: Codable {
    let value: String?
}

struct Url: Codable {
    let value: String?
}
