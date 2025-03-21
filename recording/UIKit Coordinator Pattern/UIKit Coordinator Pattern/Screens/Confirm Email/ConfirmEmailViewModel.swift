//
//  ConfirmEmailViewModel.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

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
