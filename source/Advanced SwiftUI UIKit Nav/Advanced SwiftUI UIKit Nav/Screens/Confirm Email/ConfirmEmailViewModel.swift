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
        @Published var showSubmittedAlert = false
        
        weak var navDelegate: ConfirmEmailNavDelegate?
    }
    
}

// MARK: - Actions
extension ConfirmEmailView.ViewModel {
    
    func onSubmitTapped() {
        showSubmittedAlert = true
    }
    
    func onConfirmSubmit() {
        navDelegate?.onConfirmEmailSubmit()
    }
    
    func onBackButtonTapped() {
        navDelegate?.onConfirmEmailBackButtonTapped()
    }
    
}
