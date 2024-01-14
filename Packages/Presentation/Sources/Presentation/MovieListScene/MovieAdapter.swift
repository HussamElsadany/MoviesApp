//
//  MovieAdapter.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import Domain

public struct MovieAdapter: Identifiable, Hashable {
    
    public typealias ID = Int
    
    public let id: Int
    public let title: String
    public let overview: String
    public let posterTiny: String
    public let posterOriginal: String
}

// MARK: - Initialization from entities
extension MovieAdapter {
    
    /// /// Initialize adapter object from given movie entity
    /// - Parameter movie: base entity
    public init(
        _ movie: MovieEntity,
        baseImageURL: String
    ) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        
        self.posterTiny = Self.generatePosterLink(
            baseImageURL: baseImageURL,
            path: movie.posterPath,
            size: .w154
        )
        self.posterOriginal = Self.generatePosterLink(
            baseImageURL: baseImageURL,
            path: movie.posterPath,
            size: .original
        )
    }
    
    private static func generatePosterLink(
        baseImageURL: String,
        path: String?,
        size: MovieImageSize
    ) -> String {
        return "\(baseImageURL)/\(size)\(path ?? "")"
    }
}

// MARK: - Mocks
extension MovieAdapter {
    static var mock: MovieAdapter {
        .init(
            id: 1,
            title: "Movie Name",
            overview: "Movie OverView, Movie OverView, Movie OverView, Movie OverView, Movie OverView.",
            posterTiny: "Image Poster Path URL",
            posterOriginal: "Image Poster Path URL"
        )
    }
}
