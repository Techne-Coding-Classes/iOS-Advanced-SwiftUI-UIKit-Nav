//
//  AppDelegate.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/2/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appCoordinator: ApplicationCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appConfiguration = AppConfiguration()
        let modelLayer = appConfiguration.configureApp()
        
        let window = UIWindow()
        appCoordinator = ApplicationCoordinator(window: window, modelLayer: modelLayer)
        appCoordinator.start()
        
        return true
    }


}

