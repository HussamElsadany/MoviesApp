//
//  MoviesUseCaseMock.swift
//
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import Domain
import Combine

struct MoviesUseCaseMock: MoviesUseCaseProtocol {
    
    private let success: Bool
    
    init(success: Bool) {
        self.success = success
    }
    
    func getMovies(page: Int, sortType: MoviesSortingType) -> AnyPublisher<MoviesListEntity, Error> {
        // Use Combine's Just to create a publisher that emits a single value (mocked data)
        if success {
            return fetchDataForMovies()
        } else {
            return fetchDataForMovies()
                .tryMap {_ in 
                    throw MockedError.errorFailure
                }
                .eraseToAnyPublisher()
        }
    }
    
    func getMovieDetails(movieId: Int) -> AnyPublisher<MovieEntity, Error> {
        // Use Combine's Just to create a publisher that emits a single value (mocked data)
        return Just(.mock)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // Replace the above fetchDataForMovies with your actual implementation
    private func fetchDataForMovies() -> AnyPublisher<MoviesListEntity, Error> {
        return Just(.mock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

extension MoviesUseCaseMock {
    enum MockedError: Error {
        case errorFailure
    }
}
