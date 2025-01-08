//
//  MoreCoordinating.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/7/25.
//

import UIKit

class MoreCoordinating: BaseCoordinator<UINavigationController> {
    
    
    
}

// MARK: - Showing Screens
private extension MoreCoordinating {
    
    func showMoreScreen() {
        let viewModel
    }
    
}

// MARK: - Starting Flows
private extension MoreCoordinating {
    
    func startLocationsFlow() {
        let coordinator = LocationsCoordinator(presenter: presenter, modelLayer: modelLayer)
        
    }
    
}

// MARK: - MoreViewNavDelegate
extension MoreCoordinating: MoreViewNavDelegate {
    
    func onMoreViewLocationsTapped() {
        
    }
    
    func onMoreViewUpgradeTapped() {
        
    }
    
}

extension MoreCoordinating
