//
//  AuthCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/4/25.
//

import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
    
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator)
    
}

class AuthCoordinator: BaseCoordinator<UINavigationController>, ConfirmEmailCoordinating {
    
    weak var delegate: AuthCoordinatorDelegate?
    
    override func start() {
        super.start()
        showLoginScreen()
    }
    
}

// MARK: - Showing Screens
extension AuthCoordinator {
    
    func showLoginScreen() {
        let viewModel = LoginView.ViewModel(userDefaults: userDefaults)
        viewModel.navDelegate = self
        
        let view = LoginView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Login"
        presenter.setViewControllers([controller], animated: true)
    }
    
    func showRegistrationScreen() {
        let viewModel = RegisterView.ViewModel()
        viewModel.navDelegate = self
        
        let view = RegisterView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Register"
        presenter.pushViewController(controller, animated: true)
    }
    
}

// MARK: - RegistrationNavDelegate
extension AuthCoordinator: RegisterNavDelegate {
    
    func onLoginTapped() {
        showLoginScreen()
    }
    
    func onRegisterComplete() {
        showConfirmEmailScreen()
    }
    
}

// MARK: - LoginNavDelegate
extension AuthCoordinator: LoginNavDelegate {
    
    func onRegisterTapped() {
        showRegistrationScreen()
    }
    
    func onLoginSuccessfull() {
        delegate?.onAuthCoordinationComplete(authCoordinator: self)
    }
    
}

// MARK: - ConfirmEmailNavDelegate
extension AuthCoordinator {
    
    func onConfirmEmailSubmit() {
        showLoginScreen()
    }
    
    func onConfirmEmailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
    
}
