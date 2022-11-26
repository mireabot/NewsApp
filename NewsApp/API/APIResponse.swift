//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/25/22.
//

import Foundation

struct APIResponse : Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Sourse
    let title: String?
    let description: String?
    let publishedAt: String?
    let urlToImage: String?
    let author: String?
    let url: String?
}

struct Sourse: Codable {
    let name: String?
}
