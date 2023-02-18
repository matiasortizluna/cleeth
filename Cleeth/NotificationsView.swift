//
//  NotificationsView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 17/02/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var timesPerDay : Int = 0
    
    var body: some View {
        
        List(){
            
            Section(header: Text("")) {
                
                HStack {
                    Button("Request Permission") {
                        
                        print("Requesting Permission")
                        
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
                
            }
            
            Section(header: Text("Notifications schedule")) {
                
                // Define hours of the day and times of the day.
                
                HStack{
                    Text("Number Of Times Per Day")
                    Spacer()
                    Menu(timesPerDayString(option: self.timesPerDay)) {
                        //0
                        Button("Never", action: {
                            self.timesPerDay = 0
                        })
                        //1
                        Button("1", action: {
                            self.timesPerDay = 1
                        })
                        //2
                        Button("2", action: {
                            self.timesPerDay = 2
                        })
                        //3
                        Button("3", action: {
                            self.timesPerDay = 3
                        })
                        //4
                        Button("4", action: {
                            self.timesPerDay = 4
                        })
                        //5
                        Button("5", action: {
                            self.timesPerDay = 5
                        })
                    }
                    
                }
                
                if(self.timesPerDay > 0){
                    ForEach(1...self.timesPerDay, id: \.self) { num in
                        
                        HStack{
                            
                            if(num == 1){
                                Text(String(num) + "st Time Of The Day")
                            }
                            if(num == 2){
                                Text(String(num) + "nd Time Of The Day")
                            }
                            if(num == 3){
                                Text(String(num) + "rd Time Of The Day")
                            }
                            if(num > 3){
                                Text(String(num) + "th Time Of The Day")
                            }
                            
                            
                            Spacer()
                            Menu(timesPerDayString(option: self.timesPerDay)) {
                                
                                
                                
                            }
                        }
                    }
                }
                
                
                
                
                
            }
            
            /*
             HStack(){
             Picker("", selection: $stopWatchManager.timeRemaining){
             ForEach(minutes, id: \.self){
             Text(timeStringPicker(time:$0))
             }
             }
             .pickerStyle(.wheel)
             }
             */
            
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.large)
        
    }
    
    private func timesPerDayString(option: Int) -> String {
        switch(option){
        case 0:
            return "Never"
        case 1:
            return "1"
        case 2:
            return "2"
        case 3:
            return "3"
        case 4:
            return "4"
        case 5:
            return "5"
        default:
            return "Never"
        }
    }
    
    
    func scheduleNotifications(times_per_day: Int, hours: [String]) -> Bool {
        
        print("Scheduling Notification")
        
        var flag = true
        
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
                flag = false
            }
        }
        
        return flag
        
    }
    
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}


