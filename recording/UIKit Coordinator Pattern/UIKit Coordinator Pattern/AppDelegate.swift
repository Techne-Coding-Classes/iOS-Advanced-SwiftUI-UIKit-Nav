//
//  AppDelegate.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/16/25.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var applicationCoordinator: ApplicationCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator.start()
        
        return true
    }

}

