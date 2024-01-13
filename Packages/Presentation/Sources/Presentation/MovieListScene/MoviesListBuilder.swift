//
//  MoviesListBuilder.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI

struct MoviesListBuilder {
    private init() {}
    
    static func build(navigationHandler: @escaping MoviesListViewModel.NavigationActionHandler) -> UIViewController {
        let viewModel = MoviesListViewModel(navigationHandler: navigationHandler)
        let view = MoviesListView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
