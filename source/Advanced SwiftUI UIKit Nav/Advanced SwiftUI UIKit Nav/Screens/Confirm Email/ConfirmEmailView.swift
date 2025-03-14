//
//  ConfirmEmailView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/13/25.
//

import SwiftUI

struct ConfirmEmailView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Confirm Email Address")
            
            TextField("", text: $viewModel.emailCode)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(UIColor.systemGray6)) // Background color for the TextField
                .cornerRadius(10) // Rounded corners
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1) // Border with rounded corners
                )
                .frame(width: 100)
            
            Button("Submit") {
                viewModel.onSubmitTapped()
            }
            .padding(.top, 30)
        }
        .navigationBarBackButtonHidden()
        .alert("Code Submitted", isPresented: $viewModel.showSubmittedAlert) {
            Button("OK", role: .none) {
                viewModel.onConfirmSubmit()
            }
        }
    }
}

#Preview {
    ConfirmEmailView(viewModel: .init())
}
