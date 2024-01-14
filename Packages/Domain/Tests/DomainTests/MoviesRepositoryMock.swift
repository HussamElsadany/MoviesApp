//
//  MoviesRepositoryMock.swift
//
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import Combine
import Domain

class MoviesRepositoryMock: MoviesRepositoryProtocol {
    
    func getMovies(page: Int, sortType: MoviesSortingType) -> AnyPublisher<MoviesListEntity, Error> {
        // Use Combine's Just to create a publisher that emits a single value (mocked data)
        return Just(.mock)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getMovieDetails(movieId: Int) -> AnyPublisher<MovieEntity, Error> {
        // Use Combine's Just to create a publisher that emits a single value (mocked data)
        return Just(.mock)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
