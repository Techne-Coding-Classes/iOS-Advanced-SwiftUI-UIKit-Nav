//
//  UpgradeViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
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
    
    func onUpgradedAccount() {
        navDelegate?.onUpgradeClose()
    }
    
    func onCloseTapped() {
        navDelegate?.onUpgradeClose()
    }
    
}
