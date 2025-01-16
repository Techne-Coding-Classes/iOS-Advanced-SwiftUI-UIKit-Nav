//
//  LocationsView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
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
                
                Text("Sync Locations by Logging In")
                    .titleTextStyle()
                    .padding(.top, 10)
                
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
