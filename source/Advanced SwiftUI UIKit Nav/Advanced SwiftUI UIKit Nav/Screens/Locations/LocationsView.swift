//
//  LocationsView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 1/5/25.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Weather Locations")
                .titleTextStyle()
        }
    }
}

#Preview {
    LocationsView(viewModel: .init())
}
