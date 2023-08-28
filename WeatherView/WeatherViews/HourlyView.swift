//
//  HourlyView.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI

struct HourlyView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
            VStack {
                displayUserLocation(userLocation: modelData.userLocation)

                List {
                    ForEach(modelData.forecast!.hourly) { hour in
                        HourCondition(current: hour)

                    }
                }
                    .opacity(0.8)
            }
        }
            .background(Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea())
    }
}
