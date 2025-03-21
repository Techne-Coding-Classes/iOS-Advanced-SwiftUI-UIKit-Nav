//
//  LocationsHostingController.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
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
        title = "Locations"
        
        let image = UIImage(systemName: "crown")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(onUpgradeTapped)
        )
        
        if viewModel.showBackButton {
            setCustomBackButton(target: self, selector: #selector(onBackTapped))
        }
    }
    
}

// MARK: - Actions
extension LocationsHostingController {
    
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onUpgradeTapped() {
        viewModel.onTappedUpgrade()
    }
    
}
