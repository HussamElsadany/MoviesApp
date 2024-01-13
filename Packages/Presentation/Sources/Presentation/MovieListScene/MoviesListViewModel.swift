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
    @Published public var movies: [MovieAdapter] = []
    @Published public var showError = false
    @Published public var showingSortingOption = false
    public var currentSort: MoviesSortingType = .popularity
    public var currentPage = 1
    public var isMorePagesAvailable = false
    
    // MARK: UseCases
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
        currentPage += 1
        loadMovies()
    }
    
    func loadAllSortTypes() -> [MoviesSortingType] {
        return MoviesSortingType.allCases
    }
}

extension MoviesListViewModel {
    enum Actions {
        case sort(MoviesSortingType)
        case openMovieDetails
    }
    
    func handleAction(_ action: Actions) {
        switch action {
        case .sort(let value):
            handleSortingAction(value)
        case .openMovieDetails: 
            break
        }
    }
    
    func handleSortingAction(_ sort: MoviesSortingType) {
        guard sort != currentSort else { return }
        movies.removeAll()
        currentSort = sort
        currentPage = 1
        loadMovies()
    }
}

// MARK: - Private
private extension MoviesListViewModel {
    func loadMovies() {
        moviesUseCase
            .getMovies(
                page: currentPage,
                sortType: currentSort
            )
            .receive(on: RunLoop.main)
            .toResult()
            .sink { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let response):
                    handleMovies(response)
                case .failure:
                    showError = true
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
