//
//  BaseCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/2/25.
//

import UIKit

/**
 The base functionality for a Coordinator object. Since it is unknown what type of
 presenter will be used (but still useful to declare the type) the presenter is declared
 as a generic type.
 */
class BaseCoordinator<ControllerType> where ControllerType: UIViewController {

    private(set) var embeddedInExistingNavStack = false
    
    let id = UUID()

    private(set) var childCoordinators = [UUID:Any]()

    var presenter: ControllerType
    let modelLayer: ModelLayer

    init(presenter: ControllerType, modelLayer: ModelLayer) {
        self.presenter = presenter
        self.modelLayer = modelLayer
    }

    /**
     The method to be called to start main coordination for the subclass.
     */
    func start() {
        if let navController = presenter as? UINavigationController {
            embeddedInExistingNavStack = navController.viewControllers.count > 0
        }
    }
}

// MARK: - Convenience
extension BaseCoordinator {
    
    var database: Database { modelLayer.dataLayer.database }
    var userDefaults: UserDefaultsManager { modelLayer.systemLayer.userDefaultsManager }
    
}

//MARK: - Child Coordinator Management
extension BaseCoordinator {

    /**
     Stores the coordinator in the 'childCoordinators' dictionary. This will do nothing if the coordinator already exists.

     - parameters:
        - coordinator: The coordinator to store in the internal 'childCoordinators' list
     */
    func store<U>(coordinator: BaseCoordinator<U>) where U: UIViewController {
        let coordinatorExists = childCoordinators.contains(where: { (key, value) -> Bool in
            return key == coordinator.id
        })

        if !coordinatorExists {
            childCoordinators[coordinator.id] = coordinator
        }
    }

    /**
     Release coordinator from the 'childCoordinators' dictionary

     - parameters:
        - coordinator: The coordinator that will be removed from the internal 'childCoordinators' list.
     */
    func free<U>(coordinator: BaseCoordinator<U>) where U: UIViewController {
        let coordinatorExists = childCoordinators.contains(where: { (key, value) -> Bool in
            return key == coordinator.id
        })

        if coordinatorExists {
            childCoordinators[coordinator.id] = nil
        }
    }

    /**
     Removes all child coordinators from memory. Usually used when resetting the navigation stack.
     */
    func freeAllChildCoordinators() {
        childCoordinators = [UUID: Any]()
    }

    /**
     Fetches a coordinator from the current list of child coordinators for a specified key.

     - parameters:
        - key: The unique identifier of the coordinator object
     */
    func childCoordinator<T>(forKey key: UUID) -> T? {

        guard let dictElement = childCoordinators.filter({ $0.key == key }).first,
            let coordinator = dictElement.value as? T else {
            return nil
        }

        return coordinator
    }

    /**
     Returns a child coordinator of the specific type if one exists.

     - important: This does not check for multiple values of the same type of coordinator. Only rely on this function as a source of retrieval if you
     can guarantee there is only once instance of the given type stored.

     - returns: A coordinator of the given type or none if it couldn't find any.
     */
    func childCoordinator<T>() -> T? {

        if let dictElement = childCoordinators.filter({ $0.value is T }).first,
            let coordinator = dictElement.value as? T {
            return coordinator
        }

        return nil
    }

}

// MARK: - Utils
extension BaseCoordinator {
    
    /// If this coordinator is embedded in another navigation flow then this will push the viewController
    /// onto the stack. If this coordinator is not embedded in another navigation flow then this will
    /// add the controller as the root of the navigation stack without animation.
    ///
    /// If the presenter is not a UINavigationController this will present the controller modally.
    func pushControllerBasedOnEmbeddedNavState(controller: UIViewController) {
        guard let navController = presenter as? UINavigationController else {
            presenter.present(controller, animated: true)
            return
        }
        
        if embeddedInExistingNavStack {
            navController.pushViewController(controller, animated: true)
        } else {
            navController.setViewControllers([controller], animated: false)
        }
    }
    
}
