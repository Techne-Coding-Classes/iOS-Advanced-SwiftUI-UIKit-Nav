//
//  LocationsViewModel.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

protocol LocationsNavDelegate: AnyObject {
    func onLocationsBackTapped()
    func onLocationsShowUpgradeScreen()
    func onLocationsYourAccountTapped()
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
    
    func onYourAccountTapped() {
        navDelegate?.onLocationsYourAccountTapped()
    }
    
}
