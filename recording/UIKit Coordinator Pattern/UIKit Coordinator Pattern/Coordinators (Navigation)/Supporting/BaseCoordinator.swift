//
//  BaseCoordinator.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/16/25.
//

import UIKit

class BaseCoordinator<ControllerType>: Identifiable where ControllerType: UIViewController {
    
    let id = UUID()
    
    private(set) var childCoordinators = [UUID: Any]()
    
    var presenter: ControllerType
    
    init(presenter: ControllerType) {
        self.presenter = presenter
    }
    
    func start() {
        preconditionFailure("Start method not implemented")
    }
    
}

// MARK: - Child Coordinator Management
extension BaseCoordinator {
    
    func store<U: UIViewController>(coordinator: BaseCoordinator<U>) {
        let coordinatorExists = childCoordinators.contains(where: { (key, value) -> Bool in
            return key == coordinator.id
        })
        
        if !coordinatorExists {
            childCoordinators[coordinator.id] = coordinator
        }
    }
    
    func free<U: UIViewController>(coordinator: BaseCoordinator<U>) {
        let coordinatorExists = childCoordinators.contains(where: { (key, value) -> Bool in
            return key == coordinator.id
        })
        
        if coordinatorExists {
            childCoordinators[coordinator.id] = nil
        }
    }
    
    func freeAllChildCoordinators() {
        childCoordinators = [UUID: Any]()
    }
    
    func childCoordinator<T>(forKey key: UUID) -> T? {
        return childCoordinators.first(where:  { $0.key == key })?.value as? T
    }
    
}
