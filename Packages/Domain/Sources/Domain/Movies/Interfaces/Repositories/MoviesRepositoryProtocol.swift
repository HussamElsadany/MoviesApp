//
//  MoviesRepositoryProtocol.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import Combine

public protocol MoviesRepositoryProtocol {
    /// Fetches a list of movies from a remote data source.
    ///
    /// `GET discover/movie`
    ///
    /// - Parameters:
    ///   - page: The page number to retrieve from the remote data source.
    ///
    /// - Returns: A Combine `AnyPublisher` that emits a `MoviesListEntity` or an error.
    ///
    func fetchMovies(
        page: Int
    ) -> AnyPublisher<MoviesListEntity, Error>
    
    /// Fetches a list of movies from a remote data source.
    ///
    /// `GET movie/movie_id`
    ///
    /// - Parameters:
    ///   - movieId: The unique identifier of the movie to retrieve details for.
    ///
    /// - Returns: A Combine `AnyPublisher` that emits a `MovieEntity` or an error.
    ///
    func fetchMovieDetails(
        movieId: Int
    ) -> AnyPublisher<MovieEntity, Error>
}
