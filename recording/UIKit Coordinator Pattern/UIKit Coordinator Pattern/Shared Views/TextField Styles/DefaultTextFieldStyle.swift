//
//  DefaultTextFieldStyle.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.horizontal, 5)
            .padding(.vertical, 10)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 1)
            }
        
    }
    
}

#Preview {
    VStack {
        TextField("Email", text: .constant(""))
            .textFieldStyle(DefaultTextFieldStyle())
            .padding(.horizontal, 5)
    }
}
