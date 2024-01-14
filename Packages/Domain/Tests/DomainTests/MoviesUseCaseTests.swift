//
//  MoviesUseCaseTests.swift
//  
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import XCTest
import Domain
import Combine
import Extensions

final class MoviesUseCaseTests: XCTestCase {
    
    let cancelBag: CancelBag = .init()
    
    func testGetMovies() {
        // Arrange
        let mockRepo = MoviesRepositoryMock()
        let movieUseCase = MoviesUseCase(repository: mockRepo)
        
        // Act
        let expectation = XCTestExpectation(description: "Fetch movies expectation")
        movieUseCase.getMovies(page: 1, sortType: .popularity)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { movieDetails in
                // Assert against the mocked data
                XCTAssertEqual(movieDetails, .mock)
            })
            .store(in: cancelBag)
        
        // Wait for the expectation to be fulfilled (timeout: 5 seconds)
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetMovieDetails() {
        // Arrange
        let mockRepo = MoviesRepositoryMock()
        let movieUseCase = MoviesUseCase(repository: mockRepo)
        
        // Act
        let expectation = XCTestExpectation(description: "Fetch movie details expectation")
        movieUseCase.getMovieDetails(movieId: 1)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { movieDetails in
                // Assert against the mocked data
                XCTAssertEqual(movieDetails, .mock)
            })
            .store(in: cancelBag)
        
        // Wait for the expectation to be fulfilled (timeout: 5 seconds)
        wait(for: [expectation], timeout: 5.0)
    }
}
