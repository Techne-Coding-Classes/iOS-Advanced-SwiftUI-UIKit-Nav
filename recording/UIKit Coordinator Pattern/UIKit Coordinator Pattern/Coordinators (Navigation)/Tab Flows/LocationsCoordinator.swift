//
//  LocationsCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

class LocationsCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showLocationsScreen()
    }
    
}

// MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showLocationsScreen() {
        let view = LocationsView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Locations"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
}

