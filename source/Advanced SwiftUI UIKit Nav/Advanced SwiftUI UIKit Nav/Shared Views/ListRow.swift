//
//  ListRow.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/12/25.
//

import SwiftUI

struct ListRow: View {
    
    var title: String
    var trailingText: String?
    
    var showTrailingShevron: Bool = false
    var action: (()->Void)? = nil
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                
                Spacer()
                
                if let trailingText {
                    Text(verbatim: trailingText)
                }
                
                if showTrailingShevron {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.trailing, 20)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.5))
                .frame(height: 1)
        }
        .padding(.leading, 20)
        .padding(.top, 5)
    }
}

#Preview {
    ScrollView {
        VStack {
            ListRow(title: "Email", trailingText: "john@example.com")
            ListRow(title: "Edit Account", showTrailingShevron: true)
        }
    }
    
}
