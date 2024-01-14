//
//  MoviesListViewModelTests.swift
//
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import XCTest
import Extensions
import Presentation
import AppEnvironment
import Domain

class AppEnvironmentMock: AppEnvironmentProtocol {
    var isDebug: Bool { true }
    
    var isRelease: Bool { false }
    
    func getValue<T>(_ key: EnvironmentConfigurationKeys) -> T {
        return "" as! T
    }
}

final class MoviesListViewModelTests: XCTestCase {
    
    private let cancelBag: CancelBag = .init()
    
    // Success
    func testLoadMoviesSuccess() {
        // Arrange
        let useCaseMock = MoviesUseCaseMock(success: true)
        let viewModel = MoviesListViewModel(moviesUseCase: useCaseMock,
                                            environment: AppEnvironmentMock()) { _ in }
        
        viewModel.loadMovies()
        
        // Assert
        let expectation = XCTestExpectation(description: "Loading movies")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Assuming you wait for a certain period or until the async operation completes
            // Check if the movies were loaded successfully
            XCTAssertEqual(viewModel.movies.count, MoviesListEntity.mock.results.count)
            XCTAssertFalse(viewModel.showError)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
    
    // Failure
    func testLoadMoviesFailure() {
        // Arrange
        let useCaseMock = MoviesUseCaseMock(success: false)
        let viewModel = MoviesListViewModel(moviesUseCase: useCaseMock,
                                            environment: AppEnvironmentMock()) { _ in }
        
        viewModel.loadMovies()
        
        // Assert
        let expectation = XCTestExpectation(description: "Loading movies")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Assuming you wait for a certain period or until the async operation completes
            // Check if showError is set to true
            XCTAssertTrue(viewModel.showError)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
    
}
