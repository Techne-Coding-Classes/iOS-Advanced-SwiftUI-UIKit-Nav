//
//  MoreView.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI

struct MoreView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ListRow(title: "Account", systemImageName: "person.crop.circle") {
                    viewModel.onAccountTapped()
                }
                
                ListRow(title: "Locations", systemImageName: "mappin.and.ellipse") {
                    viewModel.onLocationsTapped()
                }
                
                ListRow(title: "Upgrade", systemImageName: "crown") {
                    viewModel.onUpgradeTapped()
                }
            }
        }
    }
}

#Preview {
    MoreView(viewModel: .init())
}
