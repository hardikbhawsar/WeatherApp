//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Hardik Bhawsar on 4/18/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
     
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .center, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    AsyncImage(url: URL(string: weatherIconURL(for: weather.weather[0].main))) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text("Weather")
                        .bold()
                        .padding(.bottom)
                        .font(.title2)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.556, saturation: 0.987, brightness: 0.754))
        .preferredColorScheme(.dark)
    }
    
    func weatherIconURL(for weatherMain: String) -> String {
        switch weatherMain {
        case "Thunderstorm":
            return "https://static.vecteezy.com/system/resources/previews/024/825/169/non_2x/3d-weather-icon-night-with-rain-free-png.png"
        case "Clouds":
            return "https://static.vecteezy.com/system/resources/previews/024/825/180/non_2x/3d-weather-icon-day-free-png.png"
        case "Clear":
            return "https://static.vecteezy.com/system/resources/previews/023/404/589/non_2x/sun-icon-illustration-in-3d-style-glowing-sun-illustration-design-free-png.png"
        case "Snow":
            return "https://static.vecteezy.com/system/resources/previews/024/683/829/non_2x/3d-icon-cloudy-snow-weather-forecast-illustration-concept-icon-render-free-png.png"
        case "Rain":
            return "https://static.vecteezy.com/system/resources/previews/024/825/178/non_2x/3d-weather-icon-night-with-rain-free-png.png"
        case "Drizzle":
            return "https://static.vecteezy.com/system/resources/previews/024/825/195/non_2x/3d-weather-icon-day-with-rain-free-png.png"
        default:
            return ""
        }
    }
}

// Preview struct
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
