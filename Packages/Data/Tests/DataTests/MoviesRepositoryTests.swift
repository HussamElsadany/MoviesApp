//
//  MoviesRepositoryTests.swift
//
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import XCTest
import Data
import Extensions
import Domain

final class MoviesRepositoryTests: XCTestCase {
    
    private let cancelBag: CancelBag = .init()
    
    func testGetMovies() {
        // Arrange
        let mockNetWork = NetWorkMock(mockedObject: MoviesListEntity.mock)
        let moviesRepository = MoviesRepository(netWork: mockNetWork)
        
        // Act
        let expectation = XCTestExpectation(description: "Fetch movies expectation")
        moviesRepository.getMovies(page: 1, sortType: .popularity)
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
        let mockNetWork = NetWorkMock(mockedObject: MovieEntity.mock)
        let moviesRepository = MoviesRepository(netWork: mockNetWork)
        
        // Act
        let expectation = XCTestExpectation(description: "Fetch movie details expectation")
        moviesRepository.getMovieDetails(movieId: 1)
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
