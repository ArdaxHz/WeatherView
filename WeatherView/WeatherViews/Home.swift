//
//  Home.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI
import CoreLocation

struct Home: View {

    @EnvironmentObject var modelData: ModelData
    @State var isSearchOpen: Bool = false

    var body: some View {
        ZStack {
            Image("background2").resizable().overlay(Color.white.opacity(0.2)).edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()

                    Button {
                        self.isSearchOpen.toggle()
                    } label: {
                        Text("Change Location").bold().font(.system(size: 30))
                    }
                        .sheet(isPresented: $isSearchOpen) {
                            SearchView(isSearchOpen: $isSearchOpen)
                        }
                        .padding()

                    Spacer()
                }

                Spacer()
                displayUserLocation(userLocation: modelData.userLocation)

                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.dt ?? 0)))).formatted(
                  .dateTime.year().hour().month().day())).padding().font(.largeTitle).foregroundColor(.black)
                    .shadow(color: .black, radius: 1)

                Spacer()

                Text("Temp: \((Int)(modelData.forecast!.current.temp))ºC").padding().font(.title2)
                    .foregroundColor(.black).shadow(color: .black, radius: 0.5)

                Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%").padding().font(.title2)
                    .foregroundColor(.black).shadow(color: .black, radius: 0.5)

                Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hPa").padding().font(.title2)
                    .foregroundColor(.black).shadow(color: .black, radius: 0.5)

                Spacer()

                HStack {
                    getIconFromText(desc: modelData.forecast!.current.weather.first!.weatherDescription.rawValue)

                    Text(modelData.forecast!.current.weather.first!.weatherDescription.rawValue.capitalized).padding()
                        .font(.title2).foregroundColor(.black).shadow(color: .black, radius: 0.5)
                }
                    .padding(.bottom, 20.0)
            }
                .onAppear {
                    Task.init {
                        if modelData.userLocation.isEmpty {
                            if (modelData.forecast?.lat != nil && modelData.forecast?.lon != nil) {
                                modelData.userLocation = await getLocFromLatLong(lat: modelData.forecast?.lat ?? 0.0,
                                  lon: modelData.forecast?.lon ?? 0.0)
                            }
                        }
                    }
                }
        }
    }
}
