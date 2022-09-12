//
//  Studying_MapKitApp.swift
//  Studying-MapKit
//
//  Created by Denis Onofras on 12.09.22.
//

import SwiftUI

@main
struct Studying_MapKitApp: App {
    
    init() {
        let locationModel = LocationModel()
        locationModel.requestAuthorisation()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
