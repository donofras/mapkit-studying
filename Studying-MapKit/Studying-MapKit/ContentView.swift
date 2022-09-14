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
        ZStack(alignment: .bottom) {
            MapView(viewModel: viewModel)
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            
            if viewModel.selectedLocation != nil {
                PopupView()
                    .zIndex(1)
                    .transition(.moveAndFade)
            }
        }
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

extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        let animation = AnyTransition.scale
            .combined(with: .move(edge: .bottom))
            .combined(with: .opacity)
        return .asymmetric(insertion: animation, removal: animation)
    }
    
}

