//
//  LoginView.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Navigation App")
                .padding(.bottom, 55)
            
            EmailField(value: $viewModel.email)
            
            PasswordField(value: $viewModel.password)
            
            Button("Submit") {
                viewModel.onLoginTapped()
            }
            
            Spacer()
            
            Button("Register") {
                viewModel.onRegisterTapped()
            }
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    LoginView(viewModel: .init(userDefaults: .init()))
}
