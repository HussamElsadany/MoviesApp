//
//  MoviesListBuilder.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI
import Domain

public struct MoviesListBuilder {
    
    private init() { }
    
    public static func build(
        moviesUseCase: MoviesUseCaseProtocol,
        navigationHandler: @escaping MoviesListViewModel.NavigationActionHandler
    ) -> UIViewController {
        let viewModel = MoviesListViewModel(moviesUseCase: moviesUseCase,
                                            navigationHandler: navigationHandler)
        let view = MoviesListView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
