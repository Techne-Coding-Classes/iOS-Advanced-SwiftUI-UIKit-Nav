//
//  AppConfiguration.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/4/25.
//

import Foundation

class AppConfiguration {
    
    func configureApp() -> ModelLayer {
        // Initialize 3rd party libraries.
        // Setup visual theme(s)
        
        let modelLayer = configureModelLayer()
        
        // Migrate Database
        
        return modelLayer
    }
    
}

// MARK: - ModelLayer
private extension AppConfiguration {
    
    func configureModelLayer() -> ModelLayer {
        let database = Database()
        return ModelLayer(database: database)
    }
    
}
