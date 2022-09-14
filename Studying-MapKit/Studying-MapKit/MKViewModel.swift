//
//  MKViewModel.swift
//  Studying-MapKit
//
//  Created by Denis Onofras on 12.09.22.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


final class MKViewModel: ObservableObject {
    
    private var locationModel = LocationModel()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.02485031449219, longitude: 28.8327852708965),
        latitudinalMeters: 1750,
        longitudinalMeters: 1750
    )
    
    @Published var userTrackingMode: MapUserTrackingMode = .follow
    @Published var showsUserLocation: Bool = true
    @Published var interactionModes:  MapInteractionModes = .all
    
    @Published var showAddLocation: Bool = false
    @Published var selectedLocation: Location?
    
    @Published var  locations = [
        Location(name: "Stephen the Great Monument", coordinate: CLLocationCoordinate2D(latitude: 47.02562, longitude: 28.83033)),
        Location(name: "Cathedral of Christ's Nativity", coordinate: CLLocationCoordinate2D(latitude: 47.02625, longitude: 28.83459))
    ]
    
    func getCurrentLocation() {
        guard let location = locationModel.lastLocation else { return }
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                           longitude: location.coordinate.longitude),
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
    }
}
