//
//  MoviesEndpoint.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import CoreNetwork

public enum MoviesEndpoint {
    case getMovies(page: Int)
    case getMoviesDetails(movieId: Int)
}

extension MoviesEndpoint: HTTPEndpoint {
    public var baseURL: String {
        CommonMovieService.baseURL
    }
    
    public var path: String {
        switch self {
        case .getMovies:
            return "/discover/movie"
        case .getMoviesDetails(let movieId):
            return "/movie/\(movieId)"
        }
    }
    
    public var method: HttpMethod {
        .get
    }
    
    public var httpBody: Encodable? {
        nil
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    public var queryParameters: [URLQueryItem]? {
        switch self {
        case .getMovies(let page):
            let pageKeyItem = URLQueryItem(name: "page", value: "\(page)")
            var queryParameters = CommonMovieService.queryItems
            queryParameters.append(pageKeyItem)
            return queryParameters
        case .getMoviesDetails:
            return CommonMovieService.queryItems
        }
    }
    
    public var timeout: TimeInterval? {
        30
    }
}
