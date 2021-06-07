//
//  Slider.swift
//  ColorAppSwiftUI
//
//  Created by Stanislav Testov on 04.06.2021.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var sliderValue: Double
    @Binding var alertPresented: Bool
    
    let color: Color
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .bold()
                .foregroundColor(.white)
                .frame(width: 50)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
            
            TextField("", value: $sliderValue, formatter: formatter)
                .frame(width: 50, height: 30)
                .background(Color(.white))
                .multilineTextAlignment(.center)
                .alert(isPresented: $alertPresented)  {
                    Alert(title: Text("Wrong data"), message: Text("Enter value from 0 to 255"))
                }
                .onChange(of: sliderValue) { [sliderValue] newValue in
                    if 0...255 ~= newValue {
                        self.sliderValue = newValue
                    } else {
                        self.sliderValue = sliderValue
                        alertPresented.toggle()
                    }
                    
                }
            
        }
    }
    
    
}

struct Slider_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color(.systemBlue)
            ColorSlider(sliderValue: .constant(5), alertPresented: .constant(false), color: .green)
        }
    }
}
