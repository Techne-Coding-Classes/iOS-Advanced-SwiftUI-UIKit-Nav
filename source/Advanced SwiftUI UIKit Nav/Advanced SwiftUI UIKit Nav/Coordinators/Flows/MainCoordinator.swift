//
//  MainCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/4/25.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    
    func onMainCoordinationComplete(coordinator: MainCoordinator)
    
}

class MainCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        showHomeScreen()
    }
    
}

// MARK: - Showing Screens
private extension MainCoordinator {
    
    func showHomeScreen() {
        let viewModel = HomeView.ViewModel()
        viewModel.navDelegate = self
        
        let view = HomeView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Home"
        presenter.setViewControllers([controller], animated: true)
    }
    
}

// MARK: - HomeNavDelegate
extension MainCoordinator: HomeNavDelegate {
    
    func onLogoutTapped() {
        delegate?.onMainCoordinationComplete(coordinator: self)
    }
    
}
