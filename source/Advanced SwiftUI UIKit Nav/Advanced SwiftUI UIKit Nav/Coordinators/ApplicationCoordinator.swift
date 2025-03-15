//
//  ApplicationCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/2/25.
//

import Combine
import UIKit

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let logoutNotification = NotificationCenter.default.publisher(for: .logout)
    
    private var cancellables = Set<AnyCancellable>()
    
    let window: UIWindow

    private override init(presenter: UINavigationController, modelLayer: ModelLayer) {
        fatalError("ApplicationCoordinator: This init not used")
    }

    init(window: UIWindow, modelLayer: ModelLayer) {
        self.window = window

        let presenter = UINavigationController()
        presenter.isToolbarHidden = true

        super.init(presenter: presenter, modelLayer: modelLayer)

        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
        
        configure()
    }
    
    override func start() {
        if userDefaults.isLoggedIn {
            startMain()
        } else {
            startAuth()
        }
    }
    
    private func logout() {
        modelLayer.logout()
        startAuth()
    }
    
}

// MARK: - Configuration
private extension ApplicationCoordinator {
    
    func configure() {
        observeLogoutNotification()
    }
    
    func observeLogoutNotification() {
        logoutNotification
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.logout()
            }.store(in: &cancellables)
    }
    
}

// MARK: - Starting Flows
private extension ApplicationCoordinator {
    
    func startMain() {
        let mainCoordinator = MainCoordinator(presenter: presenter, modelLayer: modelLayer)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        
        store(coordinator: mainCoordinator)
    }
    
    func startAuth() {
        let authCoordinator = AuthCoordinator(presenter: presenter, modelLayer: modelLayer)
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
        logout()
        free(coordinator: coordinator)
    }
    
}
