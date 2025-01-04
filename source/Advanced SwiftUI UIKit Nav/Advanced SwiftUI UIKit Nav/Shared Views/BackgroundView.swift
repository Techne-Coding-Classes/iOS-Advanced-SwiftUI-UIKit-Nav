//
//  BackgroundView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/4/25.
//

import SwiftUI

struct BackgroundView: View {
    
    var backgroundImageName: String = "login-background"
    var backgroundLinearGradient: LinearGradient?
    var overlayOpacity: CGFloat = 0.5
    var blurRadius: CGFloat = 6
    
    var body: some View {
        if let backgroundLinearGradient {
            Rectangle()
                .foregroundStyle(backgroundLinearGradient)
                .ignoresSafeArea()
        } else {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Image(backgroundImageName).resizable().aspectRatio(contentMode: .fill))
                    .ignoresSafeArea()
                    .blur(radius: blurRadius, opaque: true)
                
                Rectangle()
                    .foregroundStyle(.black.opacity(overlayOpacity))
                    .ignoresSafeArea()
            }
        }

    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
