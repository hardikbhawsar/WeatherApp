//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Hardik Bhawsar on 4/18/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
        LocationManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Weather App").bold().font(.largeTitle)
            
            Text("Share current location to move forward!").padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        
        LocationButton(.shareCurrentLocation) {
            locationManager.requestLocation()
        }
        .cornerRadius(30)
        .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        .foregroundColor(.white)
        
    }
}

#Preview {
    WelcomeView()
}
