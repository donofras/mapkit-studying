//
//  PopupView.swift
//  Studying-MapKit
//
//  Created by Denis Onofras on 12.09.22.
//

import SwiftUI

struct PopupView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
     
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.3), radius: 25, x: 0, y: 5)
        }.padding([.leading, .trailing], 15)
    }
}
