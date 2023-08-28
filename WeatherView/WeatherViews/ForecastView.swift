//
//  ForecastView.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI

struct ForecastView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {

        ZStack {
            VStack {
                displayUserLocation(userLocation: modelData.userLocation).padding(.top)

                List {
                    ForEach(modelData.forecast!.daily) { day in
                        DailyView(day: day)
                    }
                }
                    .opacity(0.8)
            }
        }
            .background(Image("background2").resizable().aspectRatio(contentMode: .fill))
    }
}
