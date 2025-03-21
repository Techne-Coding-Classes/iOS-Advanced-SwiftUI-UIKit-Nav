//
//  ConfirmEmailHostingController.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

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
