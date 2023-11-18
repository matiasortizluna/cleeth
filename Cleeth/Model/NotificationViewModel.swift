//
//  NotificationViewModel.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 18/11/23.
//

import Foundation
import UserNotifications
import UIKit

class NotificationViewModel : ObservableObject {
    
    @Published var timesPerDay : Int = 2
    
    @Published var date1 : Date = Calendar.current.date(from: DateComponents(hour: 8))!
    @Published var date2 : Date = Calendar.current.date(from: DateComponents(hour: 23))!
    @Published var date3 : Date = Date()
    @Published var date4 : Date = Date()
    @Published var date5 : Date = Date()
    @Published var date6 : Date = Date()
    
    private var badgeCount : Int = 0
    
    private var finalBrush : String = "Almost Done! Final Brush of the day! Let's do it!"
    
    func getBadgeCount() -> Int {
        return self.badgeCount
    }
    
    func setBadgeCount(newValue: Int) -> Void {
        self.badgeCount = newValue
    }
    
    
    func scheduleLocalNotifications(){
        var hour = 0
        var minute = 0
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        if(1 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date1)
            minute = Calendar.current.component(.minute, from: date1)
            sendNotification(title: "Time To Brush Your Teeth!", body: "Don't miss your 1st Brush of the Day! (1/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(2 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date2)
            minute = Calendar.current.component(.minute, from: date2)
            sendNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (2/\(timesPerDay))" : "Don't miss your 2nd Brush of the Day! (2/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(3 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date3)
            minute = Calendar.current.component(.minute, from: date3)
            sendNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (3/\(timesPerDay))" : "Don't miss your 3rd Brush of the Day! (3/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(4 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date4)
            minute = Calendar.current.component(.minute, from: date4)
            sendNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (4/\(timesPerDay))" : "Don't miss your 4th Brush of the Day! (4/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(5 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date5)
            minute = Calendar.current.component(.minute, from: date5)
            sendNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (5/\(timesPerDay))" : "Don't miss your 5th Brush of the Day! (5/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(6 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date6)
            minute = Calendar.current.component(.minute, from: date6)
            sendNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (6/\(timesPerDay))" : "Don't miss your 6th Brush of the Day! (6/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
    }
    
    
    func sendNotification(title: String, body: String, badge: UInt,hour: Int, minute: Int) {
        self.setBadgeCount(newValue: self.getBadgeCount()+1)
        
        // Define the content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.badge = NSNumber(value: self.getBadgeCount())
        content.sound = .default
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: Calendar.current.date(from: DateComponents(hour: hour, minute: minute))!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { success in
            print(success)
        })
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: { granted, error in
            if granted {
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error)")
                    } else {
                        print("Notification at \(hour):\(minute) Scheduled Successfully!")
                    }
                }
            } else {
                print("Notification permission denied")
            }
        })
    }
    
}
