//
//  LocationsView.swift
//  UIKit Coordinator Pattern
//
//  Created by Techne Coding on 3/18/25.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject var viewModel: ViewModel
    
    private let locations = [
        "Syndney, Australia",
        "New York, New York",
        "Ontario, Canada",
        "Houston, Texas"
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(locations.enumerated()), id: \.offset) { _, location in
                    ListRow(title: location)
                }
                
                Button("Your Account") {
                    viewModel.onYourAccountTapped()
                }
                .padding(.top, 10)
            }
        }
        .navigationBarBackButtonHidden()
    }
        
}

#Preview {
    LocationsView(viewModel: .init())
}
