//
//  AccountCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/15/25.
//

import UIKit

protocol AccountCoordinatorDelegate: AnyObject {
    func onAccountCoordinationComplete(coordinator: AccountCoordinator)
}

class AccountCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AccountCoordinatorDelegate?
    
    override func start() {
        super.start()
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
        
        pushControllerBasedOnEmbeddedNavState(controller: controller)
    }
    
    func showEditAccountScreen() {
        let viewModel = EditAccountView.ViewModel()
        viewModel.navDelegate = self
    }
    
}

// MARK: - Starting Sub-Flows
extension AccountCoordinator {
    
    func startAuthFlow() {
        let authPresenter = UINavigationController()
        
        let authCoordinator = AuthCoordinator(presenter: authPresenter, modelLayer: modelLayer)
        authCoordinator.delegate = self
        
        authCoordinator.start()
        presenter.present(authCoordinator.presenter, animated: true)
        
        store(coordinator: authCoordinator)
    }
    
}

// MARK: - AccountNavDelegate
extension AccountCoordinator: AccountNavDelegate {
    
    func onAccountBackTapped() {
        presenter.popViewController(animated: true)
        delegate?.onAccountCoordinationComplete(coordinator: self)
    }
    
    func onAccountEditTapped() {
        
    }
    
    func onAccountExitTapped() {
        presenter.dismiss(animated: true)
        delegate?.onAccountCoordinationComplete(coordinator: self)
    }
    
}

// MARK: - EditAccountNavDelegate
extension AccountCoordinator: EditAccountNavDelegate {
    
    func onEditAccountBackTapped() {
        
    }
    
    func onEditAccountSubmitTapped(editedEmail: Bool) {
        if editedEmail {
            
        } else {
            
        }
    }
    
}

// MARK: - AuthCoordinatorDelegate
extension AccountCoordinator: AuthCoordinatorDelegate {
    
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator) {
        authCoordinator.presenter.dismiss(animated: true)
        free(coordinator: authCoordinator)
        
        if userDefaults.isLoggedIn {
            showAccountScreen()
        }
    }
    
}
