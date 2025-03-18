//
//  MoreCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

protocol MoreDelegate: AnyObject {
    func onMoreLogoutTapped(coordinator: MoreCoordinator)
}

class MoreCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MoreDelegate?
    
    override func start() {
        showMoreScreen()
    }
    
}

// MARK: - Showing Screens
private extension MoreCoordinator {
    
    func showMoreScreen() {
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
    func showAccountScreen() {
        let viewModel = AccountView.ViewModel()
        viewModel.navDelegate = self
        
        let view = AccountView(viewModel: viewModel)
        let controller = AccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        
        presenter.pushViewController(controller, animated: true)
    }
    
}

// MARK: - MoreViewNavDelegate
extension MoreCoordinator: MoreViewNavDelegate {
    
    func onMoreViewAccountTapped() {
        showAccountScreen()
    }
    
    func onMoreViewLocationsTapped() {
        
    }
    
    func onMoreViewUpgradeTapped() {
        
    }
    
}

extension MoreCoordinator: AccountNavDelegate {
    
    func onAccountBackTapped() {
        presenter.popViewController(animated: true)
    }
    
    func onAccountExitTapped() {
        
    }
    
    func onAccountEditTapped() {
        
    }
    
    func onAccountLogoutTapped() {
        delegate?.onMoreLogoutTapped(coordinator: self)
    }
    
}
