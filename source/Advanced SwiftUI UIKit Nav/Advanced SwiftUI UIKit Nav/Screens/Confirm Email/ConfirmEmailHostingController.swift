//
//  ConfirmEmailHostingController.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/13/25.
//

import UIKit

class ConfirmEmailHostingController: HostingController<ConfirmEmailView, ConfirmEmailView.ViewModel> {}

// MARK: - Lifecycle
extension ConfirmEmailHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - View Setup/Configuration
private extension ConfirmEmailHostingController {
    
    func setupViews() {
        title = "Confirm Email"
        
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
    
}

// MARK: - Actions
extension ConfirmEmailHostingController {
    
    @objc func onBackTapped() {
        viewModel.onBackButtonTapped()
    }
    
}
