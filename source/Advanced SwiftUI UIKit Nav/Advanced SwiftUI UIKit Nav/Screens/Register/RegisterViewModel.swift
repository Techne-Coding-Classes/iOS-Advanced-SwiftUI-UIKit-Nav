//
//  RegisterViewModel.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import Combine
import SwiftUI

protocol RegisterNavDelegate: AnyObject {
    func onRegisterComplete()
    func onLoginTapped()
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
        alertMessage = "An activation email has been sent to \(email)"
        showAlert = true
    }
    
    func onLoginTapped() {
        navDelegate?.onLoginTapped()
    }
    
}
