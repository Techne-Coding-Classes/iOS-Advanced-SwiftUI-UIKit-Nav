//
//  ConfirmEmailViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/13/25.
//

import Combine
import Foundation

protocol ConfirmEmailNavDelegate: AnyObject {
    func onConfirmEmailSubmit()
    func onConfirmEmailBackButtonTapped()
}

extension ConfirmEmailView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var emailCode = "12345"
        
        weak var navDelegate: ConfirmEmailNavDelegate?
        
    }
    
}

// MARK: - Actions
extension ConfirmEmailView.ViewModel {
    
    func onSubmitTapped() {
        navDelegate?.onConfirmEmailSubmit()
    }
    
    func onBackButtonTapped() {
        navDelegate?.onConfirmEmailBackButtonTapped()
    }
    
}
