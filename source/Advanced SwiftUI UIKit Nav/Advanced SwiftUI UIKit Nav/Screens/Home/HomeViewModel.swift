//
//  HomeViewModel.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import Combine
import SwiftUI

protocol HomeNavDelegate: AnyObject {
    func onLogoutTapped()
}

extension HomeView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        let defaultInfoText = "Tap Fetch Button to fetch secured data."
        
        @Published var infoText = ""
        
        @Published var showAlert = false
        var alertTitle = ""
        var alertMessage = ""
        
        weak var navDelegate: HomeNavDelegate?
    }
    
}

// MARK: - Actions
extension HomeView.ViewModel {
    
    func onResetInfoTextTapped() {
        infoText = defaultInfoText
    }
    
    func onLogoutTapped() {
        navDelegate?.onLogoutTapped()
    }
    
}
