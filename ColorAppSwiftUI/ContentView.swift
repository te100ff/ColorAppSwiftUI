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
    @State var redTextValue = ""
    @State var greenTextValue = ""
    @State var blueTextValue = ""
    @State var alertPresented = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
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
                ColorSlider(sliderValue: $redSliderValue, alertPresented: $alertPresented, color: .red)
                ColorSlider(sliderValue: $greenSliderValue, alertPresented: $alertPresented, color: .green)
                ColorSlider(sliderValue: $blueSliderValue, alertPresented: $alertPresented, color: .blue)
                Text(redSliderValue.debugDescription)
                Spacer()
            }
            .padding()
        }
    }
    
    private func checkColorValue() {
        let checkingValues = [redSliderValue, greenSliderValue, blueSliderValue]
        for value in checkingValues {
            if 0...255 ~= value {
                return
            } else {
                alertPresented.toggle()
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
