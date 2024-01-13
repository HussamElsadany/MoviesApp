//
//  AppCoordinator.swift
//  MoviesApp
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import UIKit
import Data
import Domain
import CoreNetwork
import Presentation

/// Main application coordinator.
final class AppCoordinator {
    
    // MARK: Properties
    private weak var window: UIWindow?
    private let rootController: UINavigationController
    
    // MARK: Initializationz
    init(
        window: UIWindow?,
        rootController: UINavigationController = UINavigationController()
    ) {
        self.window = window
        self.rootController = rootController
    }
    
    // MARK: Start The Coordinator.
    func start() {
        let network = NetworkClient()
        let repo = MoviesRepository(netWork: network)
        let useCase = MoviesUseCase(repository: repo)
        
        let view = MoviesListBuilder.build(
            moviesUseCase: useCase
        ) { [weak self] destintation in
                guard let self else { return }
                switch destintation {
                case .openMovieDetails(let movieAdapter):
                    openMovieDetails(movieAdapter)
                }
            }
        self.rootController.viewControllers = [view]
        self.window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    func openMovieDetails(_ movieAdapter: MovieAdapter) {
        let view = MovieDetailsBuilder.build()
        self.rootController.pushViewController(view, animated: true)
    }
}
