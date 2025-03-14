//
//  MoreViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/7/25.
//

import Foundation

protocol MoreViewNavDelegate: AnyObject {
    func onMoreViewAccountTapped()
    func onMoreViewLocationsTapped()
    func onMoreViewUpgradeTapped()
}

extension MoreView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: MoreViewNavDelegate?
        
    }
    
}

// MARK: - Actions
extension MoreView.ViewModel {
    
    func onAccountTapped() {
        navDelegate?.onMoreViewAccountTapped()
    }
    
    func onLocationsTapped() {
        navDelegate?.onMoreViewLocationsTapped()
    }
    
    func onUpgradeTapped() {
        navDelegate?.onMoreViewUpgradeTapped()
    }
    
}
