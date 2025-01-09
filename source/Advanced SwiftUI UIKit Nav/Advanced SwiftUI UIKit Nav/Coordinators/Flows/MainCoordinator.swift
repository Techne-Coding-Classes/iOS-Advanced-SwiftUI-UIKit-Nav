//
//  MainCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/4/25.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func onMainCoordinationComplete(coordinator: MainCoordinator)
}

enum NavigationBarTag: Int {
    case home
    case locations
    case more
}

class MainCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        presenter.setNavigationBarHidden(true, animated: false)
        let tabBarController = configureTabBarCongroller()
        presenter.setViewControllers([tabBarController], animated: true)
    }
    
}

// MARK: - Tab Bar Configuration
private extension MainCoordinator {
    
    func configureTabBarCongroller() -> UITabBarController {
        let homeCoordinator = configureHomeCoordinator()
        let locationsCoordinator = configureLocationsCoordinator()
        let moreCoordinator = configureMoreCoordinator()
        
        let controllers = [
            homeCoordinator.presenter,
            locationsCoordinator.presenter,
            moreCoordinator.presenter
        ]
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(controllers, animated: false)
        
        return tabBarController
    }
    
}

// MARK: - Sub Coordinators
private extension MainCoordinator {
    
    func configureHomeCoordinator() -> HomeCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: NavigationBarTag.home.rawValue
        )
        
        let coordinator = HomeCoordinator(presenter: flowPresenter, modelLayer: modelLayer)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureLocationsCoordinator() -> LocationsCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "Locs",
            image: UIImage(systemName: "mappin.and.ellipse"),
            tag: NavigationBarTag.locations.rawValue
        )
        
        let coordinator = LocationsCoordinator(presenter: flowPresenter, modelLayer: modelLayer)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureMoreCoordinator() -> MoreCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "More",
            image: UIImage(systemName: "line.3.horizontal"),
            tag: NavigationBarTag.more.rawValue
        )
        
        let coordinator = MoreCoordinator(presenter: flowPresenter, modelLayer: modelLayer)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
}

// MARK: - HomeNavDelegate
extension MainCoordinator: HomeNavDelegate {
    
    func onLogoutTapped() {
        delegate?.onMainCoordinationComplete(coordinator: self)
    }
    
}
