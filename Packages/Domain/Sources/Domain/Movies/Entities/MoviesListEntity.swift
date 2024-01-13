//
//  MoviesListEntity.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation

public struct MoviesListEntity: Decodable {
    public let page: Int
    public let results: [MovieEntity]
    public let totalPages: Int
    public let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
