//
//  InformationView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        
        Text("Information View")
        
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
        
        
        
        
        /*
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
         */
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
