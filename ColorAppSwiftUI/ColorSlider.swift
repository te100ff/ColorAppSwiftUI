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
        formatter.minimum = 0
        formatter.maximum = 255
        return formatter
    }
    
    var body: some View {
        HStack {
            Text(formatter.string(from: NSNumber(value: sliderValue)) ?? "")
                .bold()
                .foregroundColor(.white)
                .frame(width: 50)
                
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
            
            TextField("", value: $sliderValue, formatter: formatter)
            {_ in } onCommit: {
                if 0...255 ~= sliderValue {
                    return
                } else {
                    alertPresented.toggle()
                }
            }
                .frame(width: 50, height: 30)
                .background(Color(.white))
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .alert(isPresented: $alertPresented)  {
                    Alert(title: Text("Wrong data"), message: Text("Enter value from 0 to 255"))
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
