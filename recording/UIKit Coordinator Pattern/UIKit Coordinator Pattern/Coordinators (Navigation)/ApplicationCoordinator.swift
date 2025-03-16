//
//  ApplicationCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/16/25.
//

import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        let presenter = UINavigationController()
        presenter.isToolbarHidden = true
        
        super.init(presenter: presenter)
        
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        startAuth()
    }
    
}

// MARK: - Showing Screens
extension ApplicationCoordinator {
    
    func startAuth() {
        let view = TestView()
        let controller = UIHostingController(rootView: view)
        presenter.setViewControllers([controller], animated: false)
    }
    
}
