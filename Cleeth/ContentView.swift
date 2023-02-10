//
//  ContentView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

class StopWatchManager : ObservableObject{
    
    @Published var timeRemaining = 3*60
    
    var timer = Timer()
    
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            if(self.timeRemaining != 1){
                self.timeRemaining -= 1
            }
        })
    }
    
    func stop(){
        timer.invalidate()
    }
    
    func restart(){
        timer.invalidate()
        self.timeRemaining = 3*60
    }
    
    func add(){
        if(self.timeRemaining != 1){
            self.timeRemaining += 60
        }
    }
    
    func reduce(){
        if(self.timeRemaining != 1){
            self.timeRemaining -= 60
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    @State private var button : Bool = false
    @State private var buttonString : String = "Start"
    @State private var timeRunning : Bool = false
    
    private var minutes : [Int] = [60,120,180,240,300,360,420,480,540,600]
    
    var body: some View {
        
        
        ZStack(){
            
            Color.white
            
            VStack(){
                
                Spacer()
                
                Text(timeString(time:stopWatchManager.timeRemaining))
                
                Spacer()
                
                Button(buttonString, action: {
                    if(button == false){
                        print("Start")
                        buttonString = "Stop"
                        stopWatchManager.start()
                        timeRunning.toggle()
                        button.toggle()
                    }else{
                        print("Stop")
                        buttonString = "Start"
                        stopWatchManager.stop()
                        timeRunning.toggle()
                        button.toggle()
                    }
                })
                
                Spacer()
                
                Button("Restart", action: {
                    buttonString = "Start"
                    button = false
                    timeRunning = false
                    stopWatchManager.restart()
                })
                
                Spacer()
                
                VStack(){
                    HStack(){
                    
                        Spacer()
                        
                        Button("+", action: {
                            if(timeRunning == false){
                                stopWatchManager.add()
                                print("+")
                            }
                        })
                        
                        Spacer()
                        
                        Button("-", action: {
                            if(timeRunning == false){
                                stopWatchManager.reduce()
                                print("-")
                            }
                        })
                        
                        Spacer()
                        
                    }
                    
                    HStack(){
                        Picker("", selection: $stopWatchManager.timeRemaining){
                            ForEach(minutes, id: \.self){
                                Text(timeStringPicker(time:$0))
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
                
                Spacer()
                
                VStack{
                    HStack {
                        Button("Request Permission") {
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    print("All set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        
                        Button("Schedule Notification") {
                            
                            print("Schedule Notification")
                            
                            let content = UNMutableNotificationContent()
                            content.title = "Time to brush your teeth"
                            content.subtitle = "Feel fresh for a productive afternoon"
                            content.sound = UNNotificationSound.default


                            // show this notification five seconds from now
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                            
                            // Configure the recurring date.
                            var dateComponents = DateComponents()
                            dateComponents.calendar = Calendar.current

                            dateComponents.hour = 18    // 14:00 hours
                            dateComponents.minute = 20
                            dateComponents.second = 20
                               
                            // Create the trigger as a repeating event.
                            //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                            // Create the request
                            let uuidString = UUID().uuidString
                            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

                            // Schedule the request with the system.
                            let notificationCenter = UNUserNotificationCenter.current()
                            notificationCenter.add(request) { (error) in
                                if error != nil {
                                    print("Error in Notification")
                                }
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    private func timeStringPicker(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = 0
        return String(format: "%02i : %02i", minutes, seconds)
    }
    
    private func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i : %02i", minutes, seconds)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
