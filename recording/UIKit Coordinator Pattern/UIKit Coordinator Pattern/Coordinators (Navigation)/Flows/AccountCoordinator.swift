//
//  AccountCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import UIKit

protocol AccountCoordinatorDelegate: AnyObject {
    func onAccountCoordinationComplete(coordinator: AccountCoordinator)
}

class AccountCoordinator: BaseCoordinator<UINavigationController>, ConfirmEmailCoordinating {
    
    weak var delegate: AccountCoordinatorDelegate?
    
    override func start() {
        showAccountScreen()
    }
    
}

// MARK: - Showing Screens
extension AccountCoordinator {
    
    func showAccountScreen() {
        let viewModel = AccountView.ViewModel()
        viewModel.navDelegate = self
        
        let view = AccountView(viewModel: viewModel)
        let controller = AccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        
        pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
    }
    
    func showEditAccountScreen() {
        let viewModel = EditAccountView.ViewModel()
        viewModel.navDelegate = self
        
        let view = EditAccountView(viewModel: viewModel)
        let controller = EditAccountHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
    }
    
}

// MARK: - AccountNavDelegate
extension AccountCoordinator: AccountNavDelegate {
    
    func onAccountBackTapped() {
        presenter.popViewController(animated: true)
        delegate?.onAccountCoordinationComplete(coordinator: self)
    }
    
    func onAccountExitTapped() {
        presenter.dismiss(animated: true)
        delegate?.onAccountCoordinationComplete(coordinator: self)
    }
    
    func onAccountEditTapped() {
        showEditAccountScreen()
    }
    
    func onAccountLogoutTapped() {
        if !embeddedInExistingNavStack {
            presenter.dismiss(animated: true) {
                NotificationCenter.default.post(name: .logout, object: nil)
            }
        } else {
            NotificationCenter.default.post(name: .logout, object: nil)
        }
    }
    
}

// MARK: - EditAccountNavDelegate
extension AccountCoordinator: EditAccountNavDelegate {
    
    func onEditAccountBackTapped() {
        presenter.popViewController(animated: true)
    }
    
    func onEditAccountSubmitTapped(editedEmail: Bool) {
        if editedEmail {
            showConfirmEmailScreen()
        } else {
            presenter.popViewController(animated: true)
        }
    }
    
}

// MARK: - ConfirmEmailNavDelegate
extension AccountCoordinator {
    
    func onConfirmEmailSubmit() {
        if let accountController = presenter.viewControllers.first(where: { $0 is AccountHostingController }) {
            presenter.popToViewController(accountController, animated: true)
        } else {
            presenter.popViewController(animated: true)
        }
    }
    
    func onConfirmEmailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
    
}
