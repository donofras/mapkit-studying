//
//  MapView.swift
//  Studying-MapKit
//
//  Created by Denis Onofras on 12.09.22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var viewModel: MKViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $viewModel.region,
                    interactionModes: viewModel.interactionModes,
                    showsUserLocation: viewModel.showsUserLocation,
                    userTrackingMode: $viewModel.userTrackingMode,
                    annotationItems: viewModel.locations)
                { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        Image(systemName: "mappin.and.ellipse")
                            .frame(width: 30, height: 30)
                            .background(.red)
                            .clipShape(Circle())
                            .onTapGesture {
                                viewModel.selectedLocation = location
                            }
                    }
                }
                .ignoresSafeArea()
                .navigationTitle("London Explorer")
                .navigationBarHidden(true)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Button {
                            viewModel.showAddLocation = true
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .buttonStyle(.plain)
                        }
                        
                        Button {
                            viewModel.getCurrentLocation()
                        } label: {
                            Image(systemName: "location.fill.viewfinder")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .buttonStyle(.plain)
                        }
                        
                    }
                    
                    
                }  .padding()
                    .padding(.bottom, 35)
                
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MKViewModel()
        MapView(viewModel: vm)
    }
}
