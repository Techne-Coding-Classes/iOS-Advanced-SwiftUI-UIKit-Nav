//
//  EditAccountView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/12/25.
//

import SwiftUI

private enum Constants {
    static let labelPadding = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
}

struct EditAccountView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack() {
            LabelledInputView(label: "Name", value: $viewModel.name)
                .padding(Constants.labelPadding)
            
            LabelledInputView(
                label: "Email",
                value: $viewModel.email,
                contentType: .emailAddress,
                autocapitalization: .never
            )
                .padding(Constants.labelPadding)
            
            Button("Submit") {
                viewModel.onSubmit()
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - LabelledInputView
private extension EditAccountView {
    
    struct LabelledInputView: View {
        
        var label: String
        @Binding var value: String
        var placeholder: String = ""
        var contentType: UITextContentType = .name
        var autocapitalization: TextInputAutocapitalization?
        
        var body: some View {
            VStack {
                Text(label)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(placeholder, text: $value)
                    .textContentType(contentType)
                    .textInputAutocapitalization(autocapitalization)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(UIColor.systemGray6)) // Background color for the TextField
                    .cornerRadius(10) // Rounded corners
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1) // Border with rounded corners
                    )
            }
        }
    }
    
}

#Preview {
    EditAccountView(viewModel: .init())
}
