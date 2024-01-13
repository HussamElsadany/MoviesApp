//
//  MovieRowView.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import SwiftUI
import ImageCache

struct MovieRowView: View {
    
    let movie: MovieAdapter
    
    var body: some View {
        HStack(alignment: .center, spacing: Sizes.horizontalSpacing) {
            RemoteImageView(
                resource: RemoteImageResource(
                    path: movie.posterPath,
                    placeholder: nil
                )
            )
            .frame(width: Sizes.imageWidth)
            .clipped()
            .cornerRadius(Sizes.imageCornerRadius)
            
            VStack(alignment: .leading, spacing: Sizes.verticalSpacing) {
                Text(movie.title)
                    .font(.title3)
                Text(movie.overview)
                    .lineLimit(3)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, Sizes.viewPadding)
    }
}

private extension MovieRowView {
    struct Sizes {
        static let horizontalSpacing: CGFloat = 16
        static let verticalSpacing:   CGFloat = 8
        static let imageWidth:        CGFloat = 80
        static let imageCornerRadius: CGFloat = 8
        static let viewPadding:       CGFloat = 4
    }
}
