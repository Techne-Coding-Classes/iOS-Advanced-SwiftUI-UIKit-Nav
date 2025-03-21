//
//  LoginViewModel.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import Combine
import SwiftUI

protocol LoginNavDelegate: AnyObject {
    func onLoginRegisterTapped()
    func onLoginLoginSuccessfull()
}

extension LoginView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        
        weak var navDelegate: LoginNavDelegate?
        
        let userDefaults: UserDefaultsManager
        
        init(userDefaults: UserDefaultsManager) {
            self.userDefaults = userDefaults
        }
        
    }
    
}

// MARK: - Actions
extension LoginView.ViewModel {
    
    func onLoginTapped() {
        userDefaults.isLoggedIn = true
        navDelegate?.onLoginLoginSuccessfull()
    }
    
    func onRegisterTapped() {
        navDelegate?.onLoginRegisterTapped()
    }
    
}
