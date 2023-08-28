//
//  PollutionView.swift
//  WeatherView
//
//  Created by Abdulrahman Al-Haddad on 28/03/2023.
//

import SwiftUI

struct PollutionView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {

        ZStack {
            Image("background").resizable().overlay(Color.white.opacity(0.1))

            VStack {
                getBriefCurrentView(userLocation: modelData.userLocation, modelData: modelData)

                Text("Air Quality Data:").font(.title).foregroundColor(.black).shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)


                HStack {
                    VStack {
                        Image("so2").resizable().frame(width: 60, height: 60)

                        var so2 = modelData.airPollution?.pollutionList.first?.components.so2 ?? 0.0
                        Text(String(so2)).padding(.top, 20)
                    }
                        .padding(.trailing, 30)

                    VStack {
                        Image("no").resizable().frame(width: 60, height: 60)
                        var no = modelData.airPollution?.pollutionList.first?.components.no2 ?? 0.0
                        Text(String(no)).padding(.top, 20)
                    }
                        .padding(.trailing, 30)

                    VStack {
                        Image("voc").resizable().frame(width: 60, height: 60)
                        var co = modelData.airPollution?.pollutionList.first?.components.co ?? 0.0
                        Text(String(co)).padding(.top, 20)
                    }
                        .padding(.trailing, 30)

                    VStack {
                        Image("pm").resizable().frame(width: 60, height: 60)
                        var pm2_5 = modelData.airPollution?.pollutionList.first?.components.pm2_5 ?? 0.0
                        Text(String(pm2_5)).padding(.top, 20)
                    }
                }
            }
                .foregroundColor(.black).shadow(color: .black, radius: 0.5)
        }
            .ignoresSafeArea(edges: [.top, .trailing, .leading]).onAppear {
                Task.init {
                    try await modelData.getAirPolutionData(lat: modelData.forecast?.lat ?? 0,
                      lon: modelData.forecast?.lon ?? 0)
                }
            }
    }
}

    

