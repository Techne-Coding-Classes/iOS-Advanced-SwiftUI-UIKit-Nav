//
//  AccountHostingController.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import UIKit

class AccountHostingController: HostingController<AccountView, AccountView.ViewModel> {}

// MARK: - Lifecycle
extension AccountHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - View Setup/Configuration
private extension AccountHostingController {
    
    func setupViews() {
        title = "Account"
        
        if viewModel.showExitButton {
            setNavigationExitButton(target: self, selector: #selector(onExitButtonTapped))
        } else {
            setCustomBackButton(target: self, selector: #selector(onBackButtonTapped))
        }
    }
    
}

// MARK: - Actions
extension AccountHostingController {
    
    @objc func onBackButtonTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onExitButtonTapped() {
        viewModel.onExitTapped()
    }
    
}
