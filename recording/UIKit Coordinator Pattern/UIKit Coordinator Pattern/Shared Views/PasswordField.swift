//
//  PasswordField.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var value: String
    var placeholder: String = "Password"
    
    var body: some View {
        VStack {
            SecureField(placeholder, text: $value)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
        }
    }
}

#Preview {
    PasswordField(value: .constant(""))
}
