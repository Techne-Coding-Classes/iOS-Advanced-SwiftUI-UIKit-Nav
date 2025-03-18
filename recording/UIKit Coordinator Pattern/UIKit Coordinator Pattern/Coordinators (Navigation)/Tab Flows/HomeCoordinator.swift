//
//  HomeCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showHomeScreen()
    }
    
}

// MARK: - Showing Screens
extension HomeCoordinator {
    
    func showHomeScreen() {
        let view = HomeView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Home"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
}
