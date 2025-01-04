//
//  RegisterView.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            EmailField(value: $viewModel.email)
                .padding(.bottom, 10)
            
            PasswordField(value: $viewModel.password)
                .padding(.bottom, 10)
            
            PasswordField(value: $viewModel.confirmPassword, placeholder: "Confirm Password")
                .padding(.bottom, 10)
            
            Button("Register") {
                viewModel.onRegisterTapped()
            }
            
            Spacer()
            
            Button("Login") {
                viewModel.onLoginTapped()
            }
            
        }
        .frame(width: 250)
        .navigationTitle("Register")
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {
                if viewModel.registrationSuccessfull {
                    viewModel.navDelegate?.onRegisterComplete()
                }
            }
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    RegisterView(viewModel: .init())
}
