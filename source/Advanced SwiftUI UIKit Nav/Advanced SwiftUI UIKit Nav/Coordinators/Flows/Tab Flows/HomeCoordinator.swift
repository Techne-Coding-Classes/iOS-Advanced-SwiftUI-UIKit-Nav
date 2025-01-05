//
//  HomeCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import UIKit

class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showHomeScreen()
    }
    
}

// MARK: - Showing Screens
extension HomeCoordinator {
    
    func showHomeScreen() {
        let viewModel = HomeView.ViewModel()
        
        let view = HomeView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Home"
        presenter.setViewControllers([controller], animated: true)
    }
    
}
