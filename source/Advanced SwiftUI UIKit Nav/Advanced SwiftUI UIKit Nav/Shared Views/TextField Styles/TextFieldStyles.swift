//
//  TextFieldStyle.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import SwiftUI

struct TitleTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .font(.system(size: 24, weight: .bold))
    }
}

extension View {
    func titleTextStyle() -> some View {
        self.textFieldStyle(TitleTextFieldStyle())
    }
}
