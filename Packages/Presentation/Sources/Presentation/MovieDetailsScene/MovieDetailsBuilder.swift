//
//  MovieDetailsBuilder.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import UIKit

public struct MovieDetailsBuilder {
    
    private init() { }
    
    public static func build() -> UIViewController {
        let viewModel = MovieDetailsViewModel()
        let view = MovieDetailsViewController()
        return view
    }
}
