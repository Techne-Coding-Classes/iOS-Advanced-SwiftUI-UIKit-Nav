//
//  UpgradeViewModel.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import Foundation

protocol UpgradeViewNavDelegate: AnyObject {
    func onUpgradeClose()
}

extension UpgradeView {
    
    class ViewModel: BaseViewModel, ObservableObject {
    
        weak var navDelegate: UpgradeViewNavDelegate?
        
    }
    
}

// MARK: - Actions
extension UpgradeView.ViewModel {
    
    func onCloseScreen() {
        navDelegate?.onUpgradeClose()
    }
    
}
