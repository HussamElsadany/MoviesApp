//
//  MovieAdapter.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import Domain
import MoviesAPI

struct MovieAdapter: Identifiable {
    
    typealias ID = Int
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
}

// MARK: - Initialization from entities
extension MovieAdapter {
    
    /// /// Initialize adapter object from given movie entity
    /// - Parameter movie: base entity
    init(_ movie: MovieEntity) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        // TODO: Modify this logic to read BaseImageURL from injected object from AppEnvironment.
        self.posterPath = "\(CommonMovieService.baseImagesURL)/\(MovieImageSize.PosterSize.w154)/\(movie.posterPath ?? "")"
    }
}

// MARK: - Mocks
extension MovieAdapter {
    static var mock: MovieAdapter {
        .init(
            id: 1,
            title: "Movie Name",
            overview: "Movie OverView, Movie OverView, Movie OverView, Movie OverView, Movie OverView.",
            posterPath: "Image Poster Path URL"
        )
    }
}
