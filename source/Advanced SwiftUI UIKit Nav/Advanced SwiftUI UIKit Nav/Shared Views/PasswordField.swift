//
//  PasswordField.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var value: String
    var placeholder: String = "Password"
    
    var body: some View {
        SecureField(placeholder, text: $value)
            .textFieldStyle(DefaultTextFieldStyle())
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    PasswordField(value: .constant("tester123"))
}
