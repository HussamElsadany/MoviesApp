//
//  AppEnvironment.swift
//
//
//  Created by Hussam Elsadany on 12/01/2024.
//

import Foundation

public struct AppEnvironment {
    
    // MARK: - Properties
    private let bundle: BundleProtocol
    private let name: AppEnvironmentName
    
    public static let current = AppEnvironment(bundle: Bundle.main)
    
    // MARK: - Initialization
    init(bundle: BundleProtocol = Bundle.main) {
        self.bundle = bundle
        
        if let configuration = bundle.getConfigValue(
            key: EnvironmentConfigurationKeys.configuration.rawValue
        ), let name = AppEnvironmentName(
            rawValue: configuration
        ) {
            self.name = name
        } else {
            self.name = .release
        }
    }
}

extension AppEnvironment: AppEnvironmentProtocol {
    public var isDebug: Bool {
        name == .debug
    }
    
    public var isRelease: Bool {
        !isDebug
    }
    
    public func getValue<T>(
        _ key: EnvironmentConfigurationKeys
    ) -> T {
        guard let value = bundle.getConfigValue(key: key.rawValue) as? T else {
            fatalError("Environment. can't get value from configuration for \(key.rawValue)")
        }
        return value
    }
}

