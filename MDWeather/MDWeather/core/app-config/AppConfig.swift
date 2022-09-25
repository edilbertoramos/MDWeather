//
//  MDEnvironmentSettings.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

struct AppConfig {
    
    enum AppConfigKey: String {
        case serviceBaseUrl = "ServiceBaseUrl"
        case serviceIconUrl = "ServiceIconUrl"
    }
    
    enum AppConfigError: Error {
        case configNotFound
    }
    
    static let shared = AppConfig()
    
    private init() {}
    
}

// MARK: - Helper
extension AppConfig {
    
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
    
    private func getConfig(forKey key: AppConfigKey) throws -> String {
        guard let config = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            throw AppConfigError.configNotFound
        }
        return config
    }
    
}

