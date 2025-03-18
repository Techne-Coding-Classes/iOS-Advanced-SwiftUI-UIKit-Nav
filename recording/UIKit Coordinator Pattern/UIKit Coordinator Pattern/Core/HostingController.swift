//
//  HostingController.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI
import UIKit

class HostingController<Content: View, VM: BaseViewModel>: UIHostingController<Content> {
    
    var viewModel: VM
    
    init(rootView: Content, viewModel: VM) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
        viewModel.hostingController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("init(coder:) not implemented")
    }
    
}
