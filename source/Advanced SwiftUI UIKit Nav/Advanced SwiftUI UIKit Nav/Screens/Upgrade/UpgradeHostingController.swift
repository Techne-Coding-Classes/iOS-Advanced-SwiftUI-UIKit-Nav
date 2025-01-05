//
//  UpgradeHostingController.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import UIKit

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
        
        let closeIcon = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIBarButtonItem(image: closeIcon, style: .plain, target: self, action: #selector(onCloseTapped))
        navigationItem.rightBarButtonItem = closeButton
    }
    
}

// MARK: - Actions
extension UpgradeHostingController {
    
    @objc func onCloseTapped() {
        viewModel.onCloseTapped()
    }
    
}
