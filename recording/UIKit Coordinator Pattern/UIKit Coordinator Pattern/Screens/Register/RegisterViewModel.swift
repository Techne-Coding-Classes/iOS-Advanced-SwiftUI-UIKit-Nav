//
//  RegisterViewModel.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import Combine
import SwiftUI

protocol RegisterNavDelegate: AnyObject {
    func onRegisterComplete()
    func onRegisterLoginTapped()
}

extension RegisterView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        @Published var confirmPassword = ""
        
        @Published var showAlert = false
        var alertTitle = ""
        var alertMessage = ""
        var registrationSuccessfull = false
        
        weak var navDelegate: RegisterNavDelegate?
        
    }
    
}

// MARK: - Actions
extension RegisterView.ViewModel {
    
    func onRegisterTapped() {
        registrationSuccessfull = true
        alertTitle = "Registration Successfull!"
        alertMessage = "An Activation email has been sent to \(email)"
        showAlert = true
    }
    
    func onRegisterComplete() {
        navDelegate?.onRegisterComplete()
    }
    
    func onLoginTapped() {
        navDelegate?.onRegisterLoginTapped()
    }
    
}
