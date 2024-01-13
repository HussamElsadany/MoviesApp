//
//  MoviesListViewModel.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI
import Combine
import CombineExtensions

final class MoviesListViewModel: ObservableObject {
    // MARK: - Private properties
    private let cancelBag: CancelBag
    private let navigationHandler: MoviesListViewModel.NavigationActionHandler
    
    // MARK: - Public properties
//    @State var viewState: <#Need to define ViewState type#>
    
    // MARK: - Initialization
    init(navigationHandler: @escaping MoviesListViewModel.NavigationActionHandler) {
        self.cancelBag = .init()
        self.navigationHandler = navigationHandler
    }
}

// MARK: - Private
private extension MoviesListViewModel {
    
}

// MARK: - Navigation
extension MoviesListViewModel {
    typealias NavigationActionHandler = (MoviesListViewModel.NavigationAction) -> Void
    
    /// Defines all possible navigation actions from another screens
    enum NavigationAction {
        
    }
}
