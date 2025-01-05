//
//  HomeView.swift
//  iOS Auth SwiftUI
//
//  Created by Techne Coding on 2/4/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {

            Text("Home Page")
                .titleTextStyle()
            
        }
        .navigationTitle("Home")
        .navigationBarBackButtonHidden()
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel, action: {})
        }  message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    HomeView(viewModel: .init())
}
