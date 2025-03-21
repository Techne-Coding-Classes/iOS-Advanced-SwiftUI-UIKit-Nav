//
//  EditAccountHostingController.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

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
