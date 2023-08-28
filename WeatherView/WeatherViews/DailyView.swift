//
//  WeatherDailyView.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI

struct DailyView: View {
    var day: Daily

    var body: some View {

        HStack {
            getIconFromText(desc: day.weather.first?.weatherDescription.rawValue ?? "No Value").padding(.trailing)
            VStack {
                Text(day.weather.first?.weatherDescription.rawValue.capitalized ?? "No Value")

                Text(getDate(day: day.dt))
            }
                .padding(.trailing).multilineTextAlignment(.center)
            Text("\((Int)(day.temp.max))ºC / \((Int)(day.temp.min))ºC")
        }
            .padding()
    }
}

func getDate(day: Int) -> String {
    var date = Date(timeIntervalSince1970: TimeInterval(((Int)(day))))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE dd"

    return dateFormatter.string(from: date)
}

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily

    static var previews: some View {
        DailyView(day: day[0])
    }
}
