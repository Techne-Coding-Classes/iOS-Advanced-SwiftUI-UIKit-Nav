//
//  UpgradeView.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
//

import SwiftUI

struct UpgradeView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack {
            Text("Would you like to upgrade your account?")
                
            Button("Upgrade Account") {
                viewModel.onCloseScreen()
            }
        }
        
    }
}

#Preview {
    UpgradeView(viewModel: .init())
}
