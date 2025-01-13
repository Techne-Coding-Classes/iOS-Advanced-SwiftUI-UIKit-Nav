//
//  EditAccountHostingController.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/13/25.
//

import UIKit

class EditAccountHostingController: HostingController<EditAccountView, EditAccountView.ViewModel> {}

// MARK: - Lifecycle
extension EditAccountHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - View Setup/Configuration
private extension EditAccountHostingController {
    
    func setupViews() {
        title = "Edit Account"
        
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
    
}

// MARK: - Actions
extension EditAccountHostingController {
    
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
    
}
