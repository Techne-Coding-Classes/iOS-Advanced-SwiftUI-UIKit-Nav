//
//  AccountHostingController.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/12/25.
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
        
        let editIcon = UIImage(systemName: "pencil")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        let editButton = UIBarButtonItem(image: editIcon, style: .plain, target: self, action: #selector(onEditAccountTapped))
        
        setCustomBackButton(target: self, selector: #selector(onBackButtonTapped))
    }
    
}

// MARK: - Actions
extension AccountHostingController {
    
    @objc func onBackButtonTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onEditAccountTapped() {
        viewModel.onEditTapped()
    }
    
}
