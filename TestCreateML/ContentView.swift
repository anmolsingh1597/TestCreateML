//
//  ContentView.swift
//  TestCreateML
//
//  Created by Anmol singh on 2020-07-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ContentView: View {
    //to track when does user want to wake up
    @State private var wakeUp = defaultWakeUp
    
    //to track how much user want to sleep in hours
    @State private var sleepAmount = 8.0
    
    //to track number of cup of daily coffe intake
    @State private var coffeeAmount = 1
    
    var sleepTime: String {
        let st = calculateStartTime()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return  "\(dateFormatter.string(from: st))"
    }
    
    
    static var defaultWakeUp: Date{
        var dateComponents = DateComponents()
        dateComponents.hour = 7
        dateComponents.minute = 0
        return Calendar.current.date(from: dateComponents) ?? Date()
    }
    var body: some View {
        NavigationView{
            ScrollView{
                
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Estimated time required")
                            .font(.headline)
                            .foregroundColor(Color(UIColor.white))
                        
                        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                            Text("\(sleepAmount, specifier: "%g") hours")
                                .font(.subheadline)
                        }.colorInvert().colorMultiply(Color.white)
                    }
                .fixedSize(horizontal: false, vertical: true)
                    .addRedBackgroundStyle()
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Coffee break")
                            .font(.headline)
                            .foregroundColor(Color(UIColor.white))
                        
                        Stepper(value: $coffeeAmount, in: 1...19){
//                            if coffeeAmount == 1{
//                                Text("1")
//                                    .font(.largeTitle)
//                            }else if coffeeAmount < 3{
//                                Text("\(coffeeAmount)")
//                                    .font(.largeTitle)
//                            }else if coffeeAmount < 6{
//                                Text("\(coffeeAmount)")
//                                    .font(.largeTitle)
//                            }else{}
                                Text("\(coffeeAmount)")
                                    .font(.largeTitle)
                            
                        }.colorInvert().colorMultiply(Color.white)
                    }
                    .addBlueBackgroundStyle()
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to start")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.white))
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        //to hide the label
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .colorInvert().colorMultiply(Color.white)
                }.addPinkBackgroundStyle()
                
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Your should start at")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.white))
                    Text("\(sleepTime)")
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.white))
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .addGreenBackgroundStyle()
                .padding(.bottom)
            }
            .navigationBarTitle("Scheduler")
        }
    }
    
    
    func calculateStartTime() -> Date {
        
        let model = Scheduler()
        
        let dateComponents = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
        let hoursInSeconds = (dateComponents.hour ?? 0) * 60 * 60
        let minutesInSeconds = (dateComponents.minute ?? 0) * 60
        
        do{
            let prediction = try model.prediction(deadline: Double(hoursInSeconds + minutesInSeconds), noOfHoursRequired: Double(sleepAmount), coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.startTime
            return sleepTime
        }catch{
            return Date()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


