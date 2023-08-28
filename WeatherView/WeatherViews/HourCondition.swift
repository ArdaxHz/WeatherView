//
//  HourCondition.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI

struct HourCondition: View {
    var current: Current

    var body: some View {
        HStack {
            VStack {
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(current.dt)))).formatted(date: .omitted,
                  time: .shortened))

                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(current.dt)))).formatted(
                  Date.FormatStyle().weekday(.abbreviated)))
            }

            Spacer()
            getIconFromText(desc: current.weather.first?.weatherDescription.rawValue ?? "No Value")
            Spacer()

            HStack {
                Text("\((Int)(current.temp))ºC").foregroundColor(.black)

                let weatherDesc = String(current.weather.first?.weatherDescription.rawValue ?? "No Value")

                VStack {
                    Text(weatherDesc.capitalized).foregroundColor(.black)
                }
            }
        }
            .padding()
    }
}

struct HourCondition_Previews: PreviewProvider {
    static var hourly = ModelData().forecast!.hourly

    static var previews: some View {
        HourCondition(current: hourly[0])
    }
}
