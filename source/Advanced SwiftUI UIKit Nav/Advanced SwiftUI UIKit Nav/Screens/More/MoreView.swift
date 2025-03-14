//
//  MoreView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/7/25.
//

import SwiftUI

struct MoreView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                MoreOptionView(title: "Account", imageName: "person.crop.circle") {
                    viewModel.onAccountTapped()
                }
                
                MoreOptionView(title: "Locations", imageName: "mappin.and.ellipse") {
                    viewModel.onLocationsTapped()
                }
                
                MoreOptionView(title: "Upgrade", imageName: "crown") {
                    viewModel.onUpgradeTapped()
                }
            }
        }

    }
}

// MARK: - MoreOptionView
private extension MoreView {
    
    struct MoreOptionView: View {
        
        var title: String
        var imageName: String?
        var action: (()->Void)?
        
        var body: some View {
            VStack {
                HStack {
                    if let imageName {
                        Image(systemName: imageName)
                            .frame(width: 20)
                    }
                    
                    Text(title)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                }
                
                
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(height: 1)
            }
            .contentShape(Rectangle())
            .padding(.leading, 10)
            .onTapGesture {
                action?()
            }
        }
    }
    
}

#Preview {
    MoreView(viewModel: .init())
}
