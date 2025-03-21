//
//  SystemLayer.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

class SystemLayer {
    
    let userDefaults: UserDefaultsManager
    
    init(userDefaults: UserDefaultsManager) {
        self.userDefaults = userDefaults
    }
    
}

extension SystemLayer {
    
    func logout() {
        userDefaults.clearAllUserDefaults()
    }
    
}
