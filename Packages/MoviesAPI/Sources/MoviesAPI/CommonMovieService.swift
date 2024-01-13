//
//  CommonMovieService.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import AppEnvironment

enum CommonMovieService {
    
    static let supportedLanguages = Set(Bundle.main.localizations)
    
    static var baseURL: String {
        let apiBaseURL: String = AppEnvironment.current.getValue(.apiBASEURL)
        let apiVersion: String = AppEnvironment.current.getValue(.apiVersion)
        return "https://\(apiBaseURL)/\(apiVersion)"
    }
    
    static var apiKey: String {
        AppEnvironment.current.getValue(.apiKey)
    }
    
    static var language: String {
        guard let current = Locale.current.language.languageCode?.identifier,
              CommonMovieService.supportedLanguages.contains(current) else {
            return "en"
        }
        return current
    }
    
    static var queryItems: [URLQueryItem] {
        let apiKeyItem = URLQueryItem(name: "api_key", value: CommonMovieService.apiKey)
        let language = URLQueryItem(name: "language", value: CommonMovieService.language)
        return [apiKeyItem, language]
    }
}
