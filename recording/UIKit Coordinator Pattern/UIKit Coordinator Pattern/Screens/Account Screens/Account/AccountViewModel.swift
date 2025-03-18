//
//  AccountViewModel.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

protocol AccountNavDelegate: AnyObject {
    func onAccountBackTapped()
    func onAccountExitTapped()
    func onAccountEditTapped()
    func onAccountLogoutTapped()
}

extension AccountView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        weak var navDelegate: AccountNavDelegate?
        var showExitButton = false
    }
    
}

// MARK: - Actions
extension AccountView.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onAccountBackTapped()
    }
    
    func onEditTapped() {
        navDelegate?.onAccountEditTapped()
    }
    
    func onExitTapped() {
        navDelegate?.onAccountExitTapped()
    }
    
    func onLogoutTapped() {
        navDelegate?.onAccountLogoutTapped()
    }
    
}
