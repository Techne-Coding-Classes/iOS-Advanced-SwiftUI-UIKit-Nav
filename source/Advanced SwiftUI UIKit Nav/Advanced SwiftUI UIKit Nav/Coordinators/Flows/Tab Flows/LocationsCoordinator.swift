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


// MARK: - LocationsNavDelegate
extension LocationsCoordinator: LocationsNavDelegate {
    
    func onLocationsBackTapped() {
        // In a more complex flow we would pop to the viewController that is below
        // all of this coordinator's nav stack.
        presenter.popViewController(animated: true)
        delegate?.onLocationsCoordinationComplete(coordinator: self)
    }
    
    func onLocationsShowUpgradeScreen() {
        showUpgradeScreen()
    }
    
    func onLocationsYourAccountTapped() {
        
    }
    
}
