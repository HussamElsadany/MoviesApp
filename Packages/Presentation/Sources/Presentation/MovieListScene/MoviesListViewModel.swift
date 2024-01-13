//
//  MoviesListViewModel.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI
import Combine
import Extensions
import Domain

final class MoviesListViewModel: ObservableObject {
    // MARK: - Private properties
    private let cancelBag: CancelBag
    
    // MARK: - Public properties
    @Published var movies: [MovieAdapter] = []
    public var currentPage = 1
    public var isMorePagesAvailable = false
    
    // MARK: UseCase
    private let moviesUseCase: MoviesUseCaseProtocol
    
    // MARK: - Initialization
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.cancelBag = .init()
        self.moviesUseCase = moviesUseCase
    }
}

extension MoviesListViewModel {
    func viewDidAppear() {
        loadMovies()
    }
    
    func loadMoreMovies() {
        if currentPage == 3 { return }
        currentPage += 1
        loadMovies()
    }
}

// MARK: - Private
private extension MoviesListViewModel {
    func loadMovies() {
        moviesUseCase
            .getMovies(page: currentPage)
            .receive(on: RunLoop.main)
            .toResult()
            .sink { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let response):
                    handleMovies(response)
                case .failure(let failure):
                    break
                }
            }
            .store(in: cancelBag)
    }
    
    func handleMovies(_ response: MoviesListEntity) {
        isMorePagesAvailable = response.totalPages > response.page
        movies.append(contentsOf: response.results.compactMap {
            MovieAdapter($0)
        })
    }
}
