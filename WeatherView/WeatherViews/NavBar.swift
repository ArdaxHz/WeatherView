//
//  NavBar.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Label("City", systemImage: "magnifyingglass")
            }
            CurrentWeatherView().tabItem {
                Label("WeatherNow", systemImage: "sun.max.fill")
            }

            HourlyView().tabItem {
                Label("HourlyView", systemImage: "clock.fill")
            }
            ForecastView().tabItem {
                Label("ForecastView", systemImage: "calendar")
            }
            PollutionView().tabItem {
                Label("PollutionView", systemImage: "aqi.high")
            }
        }
            .onAppear {
                UITabBar.appearance().isTranslucent = false
            }
    }
}

