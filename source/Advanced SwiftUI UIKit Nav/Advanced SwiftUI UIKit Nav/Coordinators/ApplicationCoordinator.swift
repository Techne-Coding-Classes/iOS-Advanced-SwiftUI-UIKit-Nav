//
//  ApplicationCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/2/25.
//

import UIKit

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    var isLoggedIn = false
    
    
    let window: UIWindow

    private override init(presenter: UINavigationController) {
        fatalError("ApplicationCoordinator: This init not used")
    }

    init(window: UIWindow) {
        self.window = window

        let presenter = UINavigationController()
        presenter.isToolbarHidden = true

        super.init(presenter: presenter)

        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        if isLoggedIn {
            startMain()
        } else {
            startAuth()
        }
    }
    
}

// MARK: - Starting Flows
private extension ApplicationCoordinator {
    
    func startMain() {
        let mainCoordinator = MainCoordinator(presenter: presenter)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        
        store(coordinator: mainCoordinator)
    }
    
    func startAuth() {
        let authCoordinator = AuthCoordinator(presenter: presenter)
        authCoordinator.delegate = self
        authCoordinator.start()
        
        store(coordinator: authCoordinator)
    }
    
}

// MARK: - HomeNavDelegate
extension ApplicationCoordinator: AuthCoordinatorDelegate {
    
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator) {
        startMain()
        free(coordinator: authCoordinator)
    }
    
}

extension ApplicationCoordinator: MainCoordinatorDelegate {
    
    func onMainCoordinationComplete(coordinator: MainCoordinator) {
        startAuth()
        free(coordinator: coordinator)
    }
    
}
