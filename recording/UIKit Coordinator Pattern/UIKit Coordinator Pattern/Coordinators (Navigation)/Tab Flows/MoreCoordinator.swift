//
//  MoreCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

protocol MoreDelegate: AnyObject {
    func onMoreLogoutTapped(coordinator: MoreCoordinator)
}

class MoreCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    weak var delegate: MoreDelegate?
    
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
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
}

// MARK: - Starting Flows
private extension MoreCoordinator {
    
    func startAccountFlow() {
        let coordinator = AccountCoordinator(presenter: presenter, modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
    }
    
    func startLocationsFlow() {
        let coordinator = LocationsCoordinator(presenter: presenter, modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
    }
    
}

// MARK: - MoreViewNavDelegate
extension MoreCoordinator: MoreViewNavDelegate {
    
    func onMoreViewAccountTapped() {
        startAccountFlow()
    }
    
    func onMoreViewLocationsTapped() {
        startLocationsFlow()
    }
    
    func onMoreViewUpgradeTapped() {
        showUpgradeScreen()
    }
    
}

// MARK: - AccountCoordinatorDelegate
extension MoreCoordinator: AccountCoordinatorDelegate {
    
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        free(coordinator: coordinator)
    }
    
}

// MARK: - LocationsCoordinatorDelegate
extension MoreCoordinator: LocationsCoordinatorDelegate {
    
    func onLocationsCoordinationComplete(coordinator: LocationsCoordinator) {
        free(coordinator: coordinator)
    }
    
}
