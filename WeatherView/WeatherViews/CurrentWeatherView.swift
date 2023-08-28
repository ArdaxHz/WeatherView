//
//  CurrentWeatherView.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
            Image("background2").resizable().overlay(Color.white.opacity(0.2)).edgesIgnoringSafeArea(.all)

            VStack {
                VStack {
                    getBriefCurrentView(userLocation: modelData.userLocation, modelData: modelData)

                    HStack {
                        Text("Wind Speed: \((Int)(modelData.forecast!.current.windSpeed))m/s").foregroundColor(.black)
                            .padding(.trailing, 50.0)

                        let windDir = convertDegToCardinal(deg: modelData.forecast!.current.windDeg)

                        Text("Direction: \(windDir)").foregroundColor(.black)
                    }
                        .padding(.vertical)

                    HStack {
                        Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%").foregroundColor(.black)
                            .padding(.trailing, 50.0)

                        Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hPg").foregroundColor(.black)
                    }
                        .padding(.vertical)

                    HStack {
                        let sunrise = Date(timeIntervalSince1970: TimeInterval(
                          ((Int)(modelData.forecast?.current.sunrise ?? 0)))).formatted(date: .omitted,
                          time: .shortened)


                        let sunset = Date(timeIntervalSince1970: TimeInterval(
                          ((Int)(modelData.forecast?.current.sunset ?? 0)))).formatted(date: .omitted, time: .shortened)

                        HStack {
                            Image(systemName: "sunrise.fill").renderingMode(.original).foregroundColor(.yellow)
                                .font(.system(size: 20))
                            Text(sunrise)
                        }
                            .padding(.trailing, 50.0)

                        HStack {
                            Image(systemName: "sunset.fill").renderingMode(.original).foregroundColor(.yellow)
                                .font(.system(size: 20))
                            Text(sunset)
                        }

                    }
                        .padding(.vertical)
                }
                    .padding(.vertical)
            }
                .foregroundColor(.black)
            //                    .shadow(color: .black, radius: 0.5)
        }
            .ignoresSafeArea(edges: [.top, .trailing, .leading])
    }
}

func getHighTemp(mainTemp: Double, temps: [Current]) -> Double {
    var highTemp = mainTemp

    for temp in temps {
        if temp.temp > highTemp {
            highTemp = temp.temp
        }
    }
    return highTemp
}

func getLowTemp(mainTemp: Double, temps: [Current]) -> Double {
    var lowTemp = mainTemp

    for temp in temps {
        if temp.temp < lowTemp {
            lowTemp = temp.temp
        }
    }
    return lowTemp
}
