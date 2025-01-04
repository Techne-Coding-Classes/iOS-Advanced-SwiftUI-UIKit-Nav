//
//  DefaultTextFieldStyle.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
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
