//
//  AuthCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator)
}

class AuthCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AuthCoordinatorDelegate?
    
    override func start() {
        showLoginScreen()
    }
    
}

// MARK: - Showing Screens
extension AuthCoordinator {
    
    func showLoginScreen() {
        let viewModel = LoginView.ViewModel()
        viewModel.navDelegate = self
        
        let view = LoginView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Login"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
    func showRegisterScreen() {
        let viewModel = RegisterView.ViewModel()
        viewModel.navDelegate = self
        
        let view = RegisterView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Register"
        presenter.pushViewController(controller, animated: true)
    }
    
}

// MARK: - LoginNavDelegate
extension AuthCoordinator: LoginNavDelegate {
    
    func onLoginRegisterTapped() {
        showRegisterScreen()
    }
    
    func onLoginLoginSuccessfull() {
        delegate?.onAuthCoordinationComplete(authCoordinator: self)
    }
    
}

// MARK: - RegisterNavDelegate
extension AuthCoordinator: RegisterNavDelegate {
    
    func onRegisterComplete() {
        showLoginScreen()
    }
    
    func onRegisterLoginTapped() {
        showLoginScreen()
    }
    
}
