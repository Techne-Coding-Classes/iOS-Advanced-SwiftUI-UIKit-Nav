//
//  UpgradeView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import SwiftUI

struct UpgradeView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Upgrade Account")
                .titleTextStyle()
            
            Button("Upgrade Account") {
                viewModel.onUpgradedAccount()
            }
        }
        
    }
}

#Preview {
    UpgradeView(viewModel: .init())
}
