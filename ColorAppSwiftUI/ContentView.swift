//
//  ContentView.swift
//  ColorAppSwiftUI
//
//  Created by Stanislav Testov on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(
                        red: redSliderValue/255,
                        green: greenSliderValue/255,
                        blue: blueSliderValue/255
                    )
                    )
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 5))
                    .padding()
                ColorSlider(sliderValue: $redSliderValue, color: .red)
                ColorSlider(sliderValue: $greenSliderValue, color: .green)
                ColorSlider(sliderValue: $blueSliderValue, color: .blue)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
