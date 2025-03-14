//
//  SystemLayer.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 3/14/25.
//

import Foundation

class SystemLayer {
    
    let userDefaultsManager: UserDefaultsManager
    
    init(userDefaultsManager: UserDefaultsManager) {
        self.userDefaultsManager = userDefaultsManager
    }
    
}

extension SystemLayer {
    
    func logout() {
        userDefaultsManager.clearAllUserDefaults()
    }
    
}
