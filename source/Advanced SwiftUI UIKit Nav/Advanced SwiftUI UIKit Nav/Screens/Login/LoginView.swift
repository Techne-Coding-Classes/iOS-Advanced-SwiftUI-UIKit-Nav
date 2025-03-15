//
//  LoginView.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Navigation App")
                .titleTextStyle()
                .padding(.bottom, 55)
            
            EmailField(value: $viewModel.email)
            
            PasswordField(value: $viewModel.password)
            
            Button("Submit") {
                viewModel.onLoginTapped()
            }
            .padding(.bottom, 50)
            
            Spacer()
            
            Button("Register") {
                viewModel.onRegisterTapped()
            }
            
        }
        .frame(width: 250)
        .navigationTitle("Login")
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel, action: {})
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    NavigationStack {
        LoginView(viewModel: .init(userDefaults: .init()))
            .navigationBarTitleDisplayMode(.inline)
    }
}
