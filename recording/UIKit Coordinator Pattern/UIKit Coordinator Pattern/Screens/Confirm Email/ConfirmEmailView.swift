//
//  ConfirmEmailView.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/21/25.
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
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                }
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
