//
//  AccountViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/12/25.
//

import Foundation

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
