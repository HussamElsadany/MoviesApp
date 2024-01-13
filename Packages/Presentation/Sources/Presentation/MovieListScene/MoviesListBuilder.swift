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
        moviesUseCase: MoviesUseCaseProtocol
    ) -> UIViewController {
        let viewModel = MoviesListViewModel(moviesUseCase: moviesUseCase)
        let view = MoviesListView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
