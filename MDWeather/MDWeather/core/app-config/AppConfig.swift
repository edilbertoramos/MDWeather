//
//  MDEnvironmentSettings.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

public struct AppConfig {
    
    enum AppConfigKey: String {
        case serviceBaseUrl = "ServiceBaseUrl"
        case serviceIconUrl = "ServiceIconUrl"
        case apiKey = "ApiKey"
    }
    
    enum AppConfigError: Error {
        case configNotFound(_ config: String)
    }
    
    public static let shared = AppConfig()
    
    private init() {}
    
}

// MARK: - Public
public extension AppConfig {
    
    var baseUrl: String {
        get throws {
            try getConfig(forKey: .serviceBaseUrl)
        }
    }
    
    var iconUrl: String {
        get throws {
            try getConfig(forKey: .serviceIconUrl)
        }
    }
    
    var apiKey: String {
        get throws {
            try getConfig(forKey: .apiKey)
        }
    }
    
}

// MARK: - Helper
private extension AppConfig {

    func getConfig(forKey key: AppConfigKey) throws -> String {
        guard let config = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            throw AppConfigError.configNotFound(key.rawValue)
        }
        return config
    }
    
}
