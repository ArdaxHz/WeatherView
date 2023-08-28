//
//  BriefCurrentViewHelper.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI
import Foundation

func displayUserLocation(userLocation: String) -> some View {
    return AnyView(Text(userLocation).font(.title).foregroundColor(.black).shadow(color: .black, radius: 0.5)
        .multilineTextAlignment(.center))
}


func getBriefCurrentView(userLocation: String, modelData: ModelData) -> some View {
    return AnyView(VStack {
        displayUserLocation(userLocation: userLocation)

        Text("\((Int)(modelData.forecast!.current.temp))ºC").padding(.vertical).font(.largeTitle)

        HStack {
            getIconFromText(desc: modelData.forecast!.current.weather.first!.weatherDescription.rawValue)

            Text(modelData.forecast!.current.weather.first!.weatherDescription.rawValue.capitalized).foregroundColor(
              .black)
        }

        HStack {
            var lowTemp = getLowTemp(mainTemp: modelData.forecast!.current.temp, temps: modelData.forecast!.hourly)

            var highTemp = getHighTemp(mainTemp: modelData.forecast!.current.temp, temps: modelData.forecast!.hourly)

            Text("High: \((Int)(highTemp))ºC").foregroundColor(.black).padding(.trailing, 40.0)
            Text("Low: \((Int)(lowTemp))ºC").foregroundColor(.black)
        }
            .padding(.vertical, 20.0)


        Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC").foregroundColor(.black).padding(.vertical)
    })
}
