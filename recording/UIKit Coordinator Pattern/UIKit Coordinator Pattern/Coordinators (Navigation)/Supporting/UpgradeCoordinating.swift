//
//  UpgradeCoordinating.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import UIKit

protocol UpgradeCoordinating: BaseCoordinator<UINavigationController>, UpgradeViewNavDelegate {}

// MARK: - Showing Screens
extension UpgradeCoordinating {
    
    func showUpgradeScreen() {
        let viewModel = UpgradeView.ViewModel()
        viewModel.navDelegate = self
        
        let view = UpgradeView(viewModel: viewModel)
        let controller = UpgradeHostingController(rootView: view, viewModel: viewModel)
        
        let wrapper = UINavigationController(rootViewController: controller)
        
        presenter.present(wrapper, animated: true)
    }
    
}

// MARK: - UpgradeViewNavDelegate
extension UpgradeCoordinating {
    
    func onUpgradeClose() {
        presenter.dismiss(animated: true)
    }
    
}
