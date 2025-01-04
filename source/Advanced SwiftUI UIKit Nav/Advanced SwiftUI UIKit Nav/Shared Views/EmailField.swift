//
//  EmailField.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import SwiftUI

struct EmailField: View {
    
    @Binding var value: String
    var placeholder: String = "Email"
    
    var body: some View {
        TextField(placeholder, text: $value)
            .textFieldStyle(DefaultTextFieldStyle())
            .textContentType(.emailAddress)
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    EmailField(value: .constant("john@example.com"))
}
