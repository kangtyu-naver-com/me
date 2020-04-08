//
//  SmallCard.swift
//  0408_app
//
//  Created by 朴萬浩 on 2020/04/08.
//  Copyright © 2020 朴萬浩. All rights reserved.
//

import SwiftUI

struct SmallCard: View {
    
    var weather: Weather = Weather(id: 1, day: "Monday", weatherIcon:  "sun.max", currentTemp:  "40", minTemp: "25", maxTemp: "69", color: "mainCard")
    
    var body: some View {
        
        VStack(spacing: 20) {
           Text(self.weather.day)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
        
            
            Image(systemName: self.weather.weatherIcon)
                 .resizable()
                 .foregroundColor(Color.white)
                 .frame(width: 60, height: 60)
             
             
             ZStack {
                 Image("cloud")
                     .resizable()
                     .scaledToFill()
                     .offset(CGSize(width: 0, height: 30))
                
                 
                 VStack(spacing: 8) {
                     Text("\(self.weather.currentTemp)°").font(.title).foregroundColor(Color.white).fontWeight(.bold)
                     HStack {
                         Text("\(self.weather.minTemp)°").foregroundColor(Color("light-text"))
                         Text("\(self.weather.maxTemp)°").foregroundColor(Color.white)
                     }
                 }
             }
        }
        .frame(width: 200, height: 300)
        .background(Color(self.weather.color))
        .cornerRadius(30)
        .shadow(color: Color(weather.color).opacity(0.7), radius: 10, x: 0, y: 8)
        
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard()
    }
}
