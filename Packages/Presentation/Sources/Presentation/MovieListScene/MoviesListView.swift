//
//  MoviesListView.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI

// MARK: - MoviesListView
struct MoviesListView: View {
    
    // MARK: Properties
    @ObservedObject private var viewModel: MoviesListViewModel
    
    // MARK: Initialization
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Body
    var body: some View {
        contentView
            .navigationTitle("Movies List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            
                        },
                        label: {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                    )
                }
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Something Wrong Happen!")
                )
            })
        
    }
}

// MARK: - List
extension MoviesListView {
    
    @ViewBuilder
    var contentView: some View {
        List {
            ForEach(viewModel.movies) { movie in
                MovieRowView(movie: movie)
            }
            if viewModel.isMorePagesAvailable {
                lastRowView
            }
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}

// MARK: - LoadingView
extension MoviesListView {
    
    @ViewBuilder
    var lastRowView: some View {
        ZStack(alignment: .center) {
            ProgressView()
                .tint(.black)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: Sizes.progressViewHeight
        )
        .onAppear {
            viewModel.loadMoreMovies()
        }
    }
}

// MARK: - Sizes
private extension MoviesListView {
    struct Sizes {
        static let progressViewHeight: CGFloat = 50
    }
}
