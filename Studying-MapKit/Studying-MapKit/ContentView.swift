//
//  ContentView.swift
//  Studying-MapKit
//
//  Created by Denis Onofras on 12.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MKViewModel = MKViewModel()
    
    var body: some View {
        MapView(viewModel: viewModel)
            .sheet(isPresented: $viewModel.showAddLocation) {
                Text("Add location")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
