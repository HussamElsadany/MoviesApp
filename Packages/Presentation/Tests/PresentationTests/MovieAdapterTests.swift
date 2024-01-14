//
//  MovieAdapterTests.swift
//  
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import XCTest
import Domain
import Presentation

final class MovieAdapterTests: XCTestCase {
    
    func testInitializationFromMovieEntity() {
        // Arrange
        let movieEntity = MovieEntity.mock
        
        // Act
        let movieAdapter = MovieAdapter(movieEntity, 
                                        baseImageURL: "")
        
        // Assert
        XCTAssertEqual(movieAdapter.id, movieEntity.id)
        XCTAssertEqual(movieAdapter.title, movieEntity.title)
        XCTAssertEqual(movieAdapter.overview, movieEntity.overview)
        
        // You may want to adjust this assertion based on your actual logic for generating poster links
        XCTAssertTrue(movieAdapter.posterTiny.contains(MovieImageSize.w154.rawValue))
        XCTAssertTrue(movieAdapter.posterOriginal.contains(MovieImageSize.original.rawValue))
    }
    
}
