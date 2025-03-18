//
//  UIViewControllerExtensions.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import UIKit

extension UIViewController {
    
    func setCustomBackButton(target: Any?, selector: Selector) {
        navigationItem.hidesBackButton = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        let backImage = UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: target, action: selector)
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setNavigationExitButton(target: Any?, selector: Selector) {
        let closeIcon = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIBarButtonItem(image: closeIcon, style: .plain, target: target, action: selector)
        navigationItem.rightBarButtonItem = closeButton
    }
    
}
