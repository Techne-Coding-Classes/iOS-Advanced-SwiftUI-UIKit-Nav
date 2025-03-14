//
//  MoreCoordinating.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/7/25.
//

import UIKit

class MoreCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    override func start() {
        showMoreScreen()
    }
    
}

// MARK: - Showing Screens
private extension MoreCoordinator {
    
    func showMoreScreen() {
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        presenter.setViewControllers([controller], animated: true)
    }
    
}

// MARK: - Starting Flows
private extension MoreCoordinator {
    
    func startLocationsFlow() {
        let coordinator = LocationsCoordinator(presenter: presenter, modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
    }
    
    func startAccountFlow() {
        
    }
    
}

// MARK: - MoreViewNavDelegate
extension MoreCoordinator: MoreViewNavDelegate {
    
    func onMoreViewAccountTapped() {
        
    }
    
    func onMoreViewLocationsTapped() {
        startLocationsFlow()
    }
    
    func onMoreViewUpgradeTapped() {
        showUpgradeScreen()
    }
    
}

// MARK: - LocationsCoordinatorDelegate
extension MoreCoordinator: LocationsCoordinatorDelegate {
    
    func onLocationsCoordinationComplete(coordinator: LocationsCoordinator) {
        free(coordinator: coordinator)
    }
    
}
