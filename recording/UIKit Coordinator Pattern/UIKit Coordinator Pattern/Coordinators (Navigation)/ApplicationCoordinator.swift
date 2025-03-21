//
//  ApplicationCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/16/25.
//

import Combine
import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let logoutNotification = NotificationCenter.default.publisher(for: .logout)
    
    let window: UIWindow
    
    private var cancellables = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
        
        let presenter = UINavigationController()
        
        let systemLayer = SystemLayer(userDefaults: .init())
        let modelLayer = ModelLayer(systemLayer: systemLayer)
        
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
        start()
    }
    
}

// MARK: - Configuration
private extension ApplicationCoordinator {
    
    func configure() {
        logoutNotification
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                logout()
            }.store(in: &cancellables)
    }
    
}

// MARK: - Showing Screens
extension ApplicationCoordinator {
    
    func startAuth() {
        let authCoordinator = AuthCoordinator(presenter: presenter, modelLayer: modelLayer)
        authCoordinator.delegate = self
        authCoordinator.start()
        
        self.store(coordinator: authCoordinator)
    }
    
    func startMain() {
        let mainCoordinator = MainCoordinator(presenter: presenter, modelLayer: modelLayer)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        
        self.store(coordinator: mainCoordinator)
    }
    
}

// MARK: - AuthCoordinatorDelegate
extension ApplicationCoordinator: AuthCoordinatorDelegate {
    
    func onAuthCoordinationComplete(authCoordinator: AuthCoordinator) {
        start()
        self.free(coordinator: authCoordinator)
    }
    
}

// MARK: - MainCoordinatorDelegate
extension ApplicationCoordinator: MainCoordinatorDelegate {
    
    func onMainCoordinationComplete(coordinator: MainCoordinator) {
        start()
        self.free(coordinator: coordinator)
    }
    
}
