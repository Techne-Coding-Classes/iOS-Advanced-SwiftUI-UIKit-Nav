//
//  ModelLayer.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

class ModelLayer {
    
    let systemLayer: SystemLayer
    
    init(systemLayer: SystemLayer) {
        self.systemLayer = systemLayer
    }
    
}

extension ModelLayer {
    
    func logout() {
        systemLayer.logout()
    }
    
}
