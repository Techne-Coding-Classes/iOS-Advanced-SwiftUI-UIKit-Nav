//
//  LocationsHostingController.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import UIKit

class LocationsHostingController: HostingController<LocationsView, LocationsView.ViewModel> {}

// MARK: - Lifecycle
extension LocationsHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - View Setup/Configuration
private extension LocationsHostingController {
    
    func setupViews() {
        // Upgrade Button
        let image = UIImage(systemName: "crown")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(onTappedUpgradeButton)
        )
        
        guard viewModel.showBackButton else { return }
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
    
}

// MARK: - Actions
extension LocationsHostingController {
    
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onTappedUpgradeButton() {
        viewModel.onTappedUpgrade()
    }
    
}
