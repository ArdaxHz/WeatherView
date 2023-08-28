//
//  WindDirHelper.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import Foundation

func convertDegToCardinal(deg: Int) -> String {
    let cardinalDir = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "N"]

    return cardinalDir[Int(round(((Double)(deg % 360)) / 22.5).nextDown) + 1]
}
