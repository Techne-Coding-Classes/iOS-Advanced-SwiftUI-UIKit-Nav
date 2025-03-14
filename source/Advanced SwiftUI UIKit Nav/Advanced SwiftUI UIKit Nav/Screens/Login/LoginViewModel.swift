//
//  LoginViewModel.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import Combine
import SwiftUI

protocol LoginNavDelegate: AnyObject {
    func onRegisterTapped()
    func onLoginSuccessfull()
}

extension LoginView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        
        @Published var showAlert = false
        var alertTitle = ""
        var alertMessage = ""
        
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
        navDelegate?.onLoginSuccessfull()
    }
    
    func onRegisterTapped() {
        navDelegate?.onRegisterTapped()
    }
    
}
