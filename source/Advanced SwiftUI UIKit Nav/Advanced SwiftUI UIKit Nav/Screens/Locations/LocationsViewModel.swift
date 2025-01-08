//
//  LocationsViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import Foundation

protocol LocationsNavDelegate: AnyObject {
    func onLocationsBackTapped()
    func onLocationsShowUpgradeScreen()
}

extension LocationsView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: LocationsNavDelegate?
        
        var showBackButton = false
        
    }
    
}

// MARK: - Actions
extension LocationsView.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onLocationsBackTapped()
    }
    
    func onTappedUpgrade() {
        navDelegate?.onLocationsShowUpgradeScreen()
    }
    
}
