//
//  UpgradeHostingController.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

class UpgradeHostingController: HostingController<UpgradeView, UpgradeView.ViewModel> {}

// MARK: - Lifecycle
extension UpgradeHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - View Setup/Configuration
private extension UpgradeHostingController {
    
    func setupViews() {
        title = "Upgrade"
        setNavigationExitButton(target: self, selector: #selector(onExitTapped))
    }
    
}

// MARK: - Actions
extension UpgradeHostingController {
    
    @objc func onExitTapped() {
        viewModel.onCloseScreen()
    }
    
}
