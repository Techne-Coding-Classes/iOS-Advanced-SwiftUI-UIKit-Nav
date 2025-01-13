//
//  EditAccountViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/12/25.
//

import Foundation

protocol EditAccountNavDelegate: AnyObject {
    func onEditAccountSubmitTapped(editedEmail: Bool)
    func onEditAccountBackTapped()
}

extension EditAccountView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var name = "John Smith"
        @Published var email = "john@example.com"
        
        weak var navDelegate: EditAccountNavDelegate?
        
        
    }
    
}

// MARK: - Actions
extension EditAccountView.ViewModel {
    
    func onSubmit() {
        navDelegate?.onEditAccountSubmitTapped(editedEmail: email != "john@example.com")
    }
    
    func onBackTapped() {
        navDelegate?.onEditAccountBackTapped()
    }
    
}
