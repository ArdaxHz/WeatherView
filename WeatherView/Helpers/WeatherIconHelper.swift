//
//  WeatherIconHelper.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI
import Foundation

func getIconFromText(desc: String) -> some View {

    switch (desc.lowercased()) {
        case "broken clouds", "broken clouds: 51-84%", "overcast clouds: 85-100%", "overcast clouds":
            return AnyView(ZStack {
                Image(systemName: "cloud.fill").foregroundColor(.gray).offset(y: -4).font(.system(size: 40))
                Image(systemName: "cloud.fill").foregroundColor(.white).offset(x: -6).font(.system(size: 40))
            }
                .shadow(color: .black, radius: 2, x: 0, y: 0))
        case "clear sky":
            return AnyView(Image(systemName: "circle.fill").foregroundColor(.yellow).font(.system(size: 40))
                .shadow(color: .black, radius: 2, x: 0, y: 0))
        case "few clouds", "few clouds: 11-25%":
            return AnyView(
              Image(systemName: "cloud.sun.fill").renderingMode(.original).foregroundColor(.red).font(.system(size: 40))
                  .shadow(color: .black, radius: 2, x: 0, y: 0))
        case "light rain":
            return AnyView(Image(systemName: "cloud.sun.rain.fill").renderingMode(.original).foregroundColor(.yellow)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "scattered clouds", "scattered clouds: 25-50%":
            return AnyView(Image(systemName: "cloud.fill").foregroundColor(.white).font(.system(size: 40))
                .shadow(color: .black, radius: 2, x: 0, y: 0))
        case "moderate rain", "freezing rain", "shower rain", "light intensity shower rain", "ragged shower rain":
            return AnyView(Image(systemName: "cloud.rain.fill").renderingMode(.original).foregroundColor(.blue)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "drizzle rain", "heavy intensity drizzle rain", "light intensity drizzle rain", "heavy intensity drizzle", "shower drizzle", "shower rain and drizzle":
            return AnyView(Image(systemName: "cloud.drizzle.fill").symbolRenderingMode(.palette).foregroundColor(.blue)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "very heavy rain", "heavy intensiy rain", "exteme rain", "extreme rain", "heavy intensity shower rain", "heavy intensity rain":
            return AnyView(Image(systemName: "cloud.heavyrain.fill").renderingMode(.original).foregroundColor(.black)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "thunderstorm with light rain", "thunderstorm with rain", "thunderstorm with heavy rain", "thunderstorm with light drizzle", "thunderstorm with drizzle", "thunderstorm with heavy drizzle":
            return AnyView(
              Image(systemName: "cloud.bolt.rain.fill").symbolRenderingMode(.palette).foregroundColor(.blue)
                  .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "light thunderstorm", "thunderstorm", "heavy thunderstorm", "ragged thunderstorm":
            return AnyView(Image(systemName: "cloud.bolt.fill").symbolRenderingMode(.palette).foregroundColor(.blue)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "light snow", "snow", "heavy snow", "sleet", "light shower sleet", "shower sleet", "light rain and snow", "rain and snow", "light shower snow", "shower snow", "heavy shower snow":
            return AnyView(Image(systemName: "cloud.snow.fill").symbolRenderingMode(.palette).foregroundColor(.blue)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "fog", "mist":
            return AnyView(Image(systemName: "cloud.fog.fill").symbolRenderingMode(.palette).foregroundColor(.blue)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "sand", "dxust", "dust", "volcanic ash", "squalls", "smoke", "haze", "sand/dust whirls":
            return AnyView(Image(systemName: "sun.dust.fill").symbolRenderingMode(.palette).foregroundColor(.red)
                .font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        case "tornado":
            return AnyView(
              Image(systemName: "tornado").font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
        default:
            return AnyView(
              Image(systemName: "cloud.fill").font(.system(size: 40)).shadow(color: .black, radius: 2, x: 0, y: 0))
    }
}
