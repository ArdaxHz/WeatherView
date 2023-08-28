//
//  SearchView.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData

    @Binding var isSearchOpen: Bool
    @State var location = ""

    @State var showLocationError: Bool = false

    var body: some View {
        Spacer()
        ZStack {
            Color.teal.ignoresSafeArea()

            VStack {
                if (showLocationError) {
                    Text("\(location.capitalized) not found.").font(.largeTitle).foregroundColor(.red)
                        .shadow(color: .white, radius: 3)
                }

                TextField("Enter New Location", text: self.$location, onCommit: {
                    CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
                        if (location.isEmpty || location == nil) {
                            showLocationError = false
                            return
                        }

                        if error != nil {
                            showLocationError = true
                            return
                        }

                        let first = placemarks?.first
                        let firstLocation = first?.location

                        if let lat = firstLocation?.coordinate.latitude, let lon = firstLocation?.coordinate.longitude {

                            var localLocation = first?.name ?? "Unknown"

                            if (localLocation != first?.locality ?? "Unknown") {
                                localLocation += ", \(first?.locality ?? "Unknown")"
                            }

                            if (localLocation != first?.country ?? "Unknown") {
                                localLocation += ", \(first?.country ?? "Unknown")"
                            }

                            modelData.userLocation = localLocation
                            Task {
                                modelData.forecast = try await modelData.loadData(lat: lat, lon: lon)
                            }

                            isSearchOpen.toggle()
                        } else {
                            showLocationError = true
                        }
                    }//GEOCorder
                } //Commit
                )// TextField
                    .padding(10).shadow(color: .blue, radius: 10).cornerRadius(10).fixedSize()
                    .font(.custom("Ariel", size: 26)).textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("background")).cornerRadius(15) // TextField
                    .onChange(of: location, perform: { new_loc in

                        location = location.capitalized

                        if (location.isEmpty || location == nil) {
                            showLocationError = false
                            return
                        }
                    })
            }//VStack
        }// ZStack
        Spacer()
    }// Some
} //View
