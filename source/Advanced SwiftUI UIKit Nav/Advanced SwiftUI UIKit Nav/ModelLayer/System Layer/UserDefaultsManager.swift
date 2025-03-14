//
//  UserDefaultsManager.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 3/14/25.
//

import Foundation

class UserDefaultsManager {
    
    private enum Keys {
        static let isLoggedIn = "isLoggedIn"
    }
    
    func clearAllUserDefaults() {
        guard let bundleName = Bundle.main.bundleIdentifier else {
            return
        }
        UserDefaults.standard.removePersistentDomain(forName: bundleName)
    }
    
}

// MARK: - Accessors
extension UserDefaultsManager {
    
    var isLoggedIn: Bool {
        get { UserDefaults.standard.bool(forKey: Keys.isLoggedIn) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.isLoggedIn) }
    }
    
}
