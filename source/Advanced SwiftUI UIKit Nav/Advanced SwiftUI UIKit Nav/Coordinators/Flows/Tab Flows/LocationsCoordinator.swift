//
//  LocationsCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import UIKit

protocol LocationsCoordinatorDelegate: AnyObject {
    func onLocationsCoordinationComplete(coordinator: LocationsCoordinator)
}

class LocationsCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
        
    weak var delegate: LocationsCoordinatorDelegate?
    
    override func start() {
        super.start()
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
        
        pushControllerBasedOnEmbeddedNavState(controller: controller)
    }
    
}

// MARK: - Starting Sub Flows
private extension LocationsCoordinator {
    
    func startAccountFlow() {
        let accountPresenter = UINavigationController()
        let coordinator = AccountCoordinator(presenter: accountPresenter, modelLayer: modelLayer)
        coordinator.delegate = self
        
        coordinator.start()
        presenter.present(accountPresenter, animated: true)
        
        store(coordinator: coordinator)
    }
    
}

// MARK: - LocationsNavDelegate
extension LocationsCoordinator: LocationsNavDelegate {
    
    func onLocationsBackTapped() {
        delegate?.onLocationsCoordinationComplete(coordinator: self)
    }
    
    func onLocationsShowUpgradeScreen() {
        showUpgradeScreen()
    }
    
    func onLocationsYourAccountTapped() {
        startAccountFlow()
    }
    
}

// MARK: - AccountCoordinatorDelegate
extension LocationsCoordinator: AccountCoordinatorDelegate {
    
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        coordinator.presenter.dismiss(animated: true)
        free(coordinator: coordinator)
    }
    
}
