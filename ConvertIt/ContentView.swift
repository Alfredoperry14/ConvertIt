//
//  ContentView.swift
//  ConvertIt
//
//  Created by Alfredo Perry on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    /*
     Section{
     TextField("Measurement", value: $faren, format: .number)
     }
     */
    @State private var temp = 32.0
    @State private var units = ["Farenheit", "Celsius"]
    @State private var unit = "Farenheit"
    
    var converted: Double {
        if(unit == "Farenheit"){
            return (temp - 32) * (5/9)
        }
        else{
            return (temp * 9/5) + 32
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Temperature in \(unit)"){
                    TextField("Amount", value: $temp, format: .number)
                    
                }
                Section{
                    Picker("Units", selection: $unit){
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                var convertedTemp = unit == "Farenheit" ? "Celsius" : "Farenheit"
                
                
                Section("Temperature in \(convertedTemp)"){
                    
                    
                    Text("\(converted, specifier: "%.2f")°")
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
