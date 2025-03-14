//
//  ModelLayer.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/4/25.
//

import Foundation

class ModelLayer {
    
    let dataLayer: DataLayer
    let systemLayer: SystemLayer
    
    init(dataLayer: DataLayer, systemLayer: SystemLayer) {
        self.dataLayer = dataLayer
        self.systemLayer = systemLayer
    }
    
}

// MARK: - Convenience
extension ModelLayer {
    
    var userDefaults: UserDefaultsManager { systemLayer.userDefaultsManager }
    
}

// MARK: - Utils
extension ModelLayer {
    
    func logout() {
        dataLayer.logout()
        systemLayer.logout()
    }
    
}
