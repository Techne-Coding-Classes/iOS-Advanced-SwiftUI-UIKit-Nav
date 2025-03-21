//
//  LocationsCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

protocol LocationsCoordinatorDelegate: AnyObject {
    func onLocationsCoordinationComplete(coordinator: LocationsCoordinator)
}

class LocationsCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    weak var delegate: LocationsCoordinatorDelegate?
    
    override func start() {
        showLocationsScreen()
    }
    
}

// MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showLocationsScreen() {
        let viewModel = LocationsView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showBackButton = embeddedInExistingNavStack
        
        let view = LocationsView(viewModel: viewModel)
        let controller = LocationsHostingController(rootView: view, viewModel: viewModel)
        controller.title = "Locations"
        
        pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
    }
    
}

// MARK: - Starting Flows
private extension LocationsCoordinator {
    
    func startAccountFlow(delegate: AccountCoordinatorDelegate) {
        let accountPresenter = UINavigationController()
        let coordinator = AccountCoordinator(presenter: accountPresenter, modelLayer: modelLayer)
        coordinator.delegate = delegate
        coordinator.start()
        
        presenter.present(accountPresenter, animated: true)
        
        store(coordinator: coordinator)
    }
    
}

// MARK: - LocationsNavDelegate
extension LocationsCoordinator: LocationsNavDelegate {
    
    func onLocationsBackTapped() {
        presenter.popViewController(animated: true)
        delegate?.onLocationsCoordinationComplete(coordinator: self)
    }
    
    func onLocationsShowUpgradeScreen() {
        showUpgradeScreen()
    }
    
    func onLocationsYourAccountTapped() {
        startAccountFlow(delegate: self)
    }
    
    
}

// MARK: - AccountCoordinatorDelegate
extension LocationsCoordinator: AccountCoordinatorDelegate {
    
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        self.free(coordinator: coordinator)
    }
    
}
