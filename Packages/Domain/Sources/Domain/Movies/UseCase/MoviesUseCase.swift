//
//  MoviesUseCase.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import Combine

public protocol MoviesUseCaseProtocol {
    /// Retrieves a list of movies from a remote data source.
    ///
    /// - Parameters:
    ///   - page: The page number to retrieve from the remote data source.
    ///
    /// - Returns: A Combine `AnyPublisher` that emits a `MoviesListEntity` or an error.
    func getMovies(
        page: Int
    ) -> AnyPublisher<MoviesListEntity, Error>
    
    /// Retrieves detailed information for a specific movie.
    ///
    /// - Parameters:
    ///   - movieId: The unique identifier of the movie to retrieve details for.
    ///
    /// - Returns: A Combine `AnyPublisher` that emits a `MovieEntity` or an error.
    func getMovieDetails(
        movieId: Int
    ) -> AnyPublisher<MovieEntity, Error>

}

public final class MoviesUseCase {
    
    private let repository: MoviesRepositoryProtocol
    
    public init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
}

extension MoviesUseCase: MoviesUseCaseProtocol {
    public func getMovies(
        page: Int
    ) -> AnyPublisher<MoviesListEntity, Error> {
        repository.getMovies(page: page)
    }
    
    public func getMovieDetails(
        movieId: Int
    ) -> AnyPublisher<MovieEntity, Error> {
        repository.getMovieDetails(movieId: movieId)
    }
}
