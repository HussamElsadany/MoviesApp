//
//  Bundle.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation

protocol BundleProtocol {
    func getConfigValue(key: String) -> String?
}

extension Bundle: BundleProtocol {
    private static let ConfigurationKeys = "ConfigurationKeys"
    
    func getConfigValue(key: String) -> String? {
        guard let configDictionary = self.object(forInfoDictionaryKey: Bundle.ConfigurationKeys) as? [String : String], let configValue = configDictionary[key] else {
            return nil
        }
        return configValue
    }
}
