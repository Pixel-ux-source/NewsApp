//
//  Response.swift
//  FIlmJson
//
//  Created by Алексей on 28.04.2025.
//

import Foundation

struct ResponseAPI: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsDTO]
}

struct NewsDTO: Codable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
}
