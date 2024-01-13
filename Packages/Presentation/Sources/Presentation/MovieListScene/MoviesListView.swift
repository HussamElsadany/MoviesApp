//
//  MoviesListView.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI
import BreadfastUI

struct MoviesListView: View {
    // MARK: - Properties
    private let viewModel: MoviesListViewModel
    
    // MARK: - Initialization
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        Text("Movie List")
    }
}
