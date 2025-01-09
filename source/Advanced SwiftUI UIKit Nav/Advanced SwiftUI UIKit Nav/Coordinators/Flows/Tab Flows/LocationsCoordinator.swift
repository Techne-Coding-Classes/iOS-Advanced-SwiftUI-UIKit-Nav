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
    
    private var embeddedInExistingNavStack = false
    
    weak var delegate: LocationsCoordinatorDelegate?
    
    override func start() {
        embeddedInExistingNavStack = presenter.viewControllers.count > 0
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
        
        if embeddedInExistingNavStack {
            presenter.pushViewController(controller, animated: true)
        } else {
            presenter.setViewControllers([controller], animated: false)
        }
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
    
}
