//
//  AccountView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/12/25.
//

import SwiftUI

private enum Constants {
    static let avatarBackgroundSize: CGFloat = 70
    static var avatarSize: CGFloat { avatarBackgroundSize * 0.5 }
}

struct AccountView: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Circle()
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.avatarSize, height: Constants.avatarSize)
                }
                .frame(width: Constants.avatarBackgroundSize, height: Constants.avatarBackgroundSize)
                
                Text("John Smith")
                    .padding(.top, 20)
                
                Spacer()
                    .frame(height: 100)
                
                ListRow(title: "Email", trailingText: "john@example.com")

            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    AccountView()
}
