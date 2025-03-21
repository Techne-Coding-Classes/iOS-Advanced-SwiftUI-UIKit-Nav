//
//  ConfirmEmailCoordinating.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import UIKit

protocol ConfirmEmailCoordinating: BaseCoordinator<UINavigationController>,
                                    ConfirmEmailNavDelegate {}

// MARK: - Showing Screens
extension ConfirmEmailCoordinating {
    
    func showConfirmEmailScreen() {
        let viewModel = ConfirmEmailView.ViewModel()
        viewModel.navDelegate = self
        
        let view = ConfirmEmailView(viewModel: viewModel)
        let controller = ConfirmEmailHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
    }
    
}
