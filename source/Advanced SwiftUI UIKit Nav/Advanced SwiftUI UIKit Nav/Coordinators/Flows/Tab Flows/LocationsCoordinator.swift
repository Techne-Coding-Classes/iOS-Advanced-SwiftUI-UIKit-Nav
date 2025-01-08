//
//  LocationsCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import UIKit

class LocationsCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    var embeddedInExistingNavStack = false
    
    override func start() {
        showLocationsScreen()
    }
    
}

// MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showLocationsScreen() {
        let viewModel = LocationsView.ViewModel()
        viewModel.navDelegate = self
        
        let view = LocationsView(viewModel: viewModel)
        let controller = LocationsHostingController(rootView: view, viewModel: viewModel)
        controller.title = "Locations"
        
        if embeddedInExistingNavStack {
            presenter.setViewControllers([controller], animated: false)
        } else {
            presenter.pushViewController(controller, animated: true)
        }
    }
    
}


// MARK: - LocationsNavDelegate
extension LocationsCoordinator: LocationsNavDelegate {
    
    func onLocationsShowUpgradeScreen() {
        showUpgradeScreen()
    }
    
}
