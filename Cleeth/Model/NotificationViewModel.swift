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
    
    func requestNotificationsPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                print("Perfect, all worked.")
            } else if let error {
                print("Notification access not granted.", error.localizedDescription)
            }
        })
    }
    
    func checkIfNotificationsPermission() -> Bool{
        var notificationsAuthStatus : Bool = false
        
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { (settings) -> Void in
            notificationsAuthStatus = (settings.authorizationStatus == .authorized)
            print(settings.authorizationStatus == .authorized)
        })
        
        return notificationsAuthStatus
        
    }
    
    func setNewValuesOfNotifications() -> Void {
        self.date1 = Calendar.current.date(from: DateComponents(hour: self.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.timesPerDay, time: 1)))!
        
        self.date2  = Calendar.current.date(from: DateComponents(hour: self.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.timesPerDay, time: 2)))!
        
        self.date3  = Calendar.current.date(from: DateComponents(hour: self.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.timesPerDay, time: 3)))!
        
        self.date4  = Calendar.current.date(from: DateComponents(hour: self.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.timesPerDay, time: 4)))!
        
        self.date5  = Calendar.current.date(from: DateComponents(hour: self.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.timesPerDay, time: 5)))!
        
        self.date6 = Calendar.current.date(from: DateComponents(hour: self.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.timesPerDay, time: 6)))!
    }
    
    func calculateTimesBasedOnNumberOfTimes(timesPerDay: Int, time: Int) -> Int {
        switch (timesPerDay, time) {
        case (2, 1):
            return 8
        case (2, 2):
            return 23
        case (3, 1):
            return 8
        case (3, 2):
            return 14
        case (3, 3):
            return 23
        case (4, 1):
            return 8
        case (4, 2):
            return 14
        case (4, 3):
            return 17
        case (4, 4):
            return 23
        case (5, 1):
            return 8
        case (5, 2):
            return 11
        case (5, 3):
            return 14
        case (5, 4):
            return 17
        case (5, 5):
            return 23
        case (6, 1):
            return 8
        case (6, 2):
            return 11
        case (6, 3):
            return 14
        case (6, 4):
            return 17
        case (6, 5):
            return 20
        case (6, 6):
            return 23
        default:
            return 0
        }
    }
    
    
    func scheduleNotifications(){
        var hour = 0
        var minute = 0
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        if(1 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date1)
            minute = Calendar.current.component(.minute, from: date1)
            scheduleNotification(title: "Time To Brush Your Teeth!", body: "Don't miss your 1st Brush of the Day! (1/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(2 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date2)
            minute = Calendar.current.component(.minute, from: date2)
            scheduleNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (2/\(timesPerDay))" : "Don't miss your 2nd Brush of the Day! (2/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(3 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date3)
            minute = Calendar.current.component(.minute, from: date3)
            scheduleNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (3/\(timesPerDay))" : "Don't miss your 3rd Brush of the Day! (3/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(4 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date4)
            minute = Calendar.current.component(.minute, from: date4)
            scheduleNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (4/\(timesPerDay))" : "Don't miss your 4th Brush of the Day! (4/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(5 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date5)
            minute = Calendar.current.component(.minute, from: date5)
            scheduleNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (5/\(timesPerDay))" : "Don't miss your 5th Brush of the Day! (5/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
        if(6 <= self.timesPerDay){
            hour = Calendar.current.component(.hour, from: date6)
            minute = Calendar.current.component(.minute, from: date6)
            scheduleNotification(title: "Time To Brush Your Teeth!", body: hour>=20 ? "\(finalBrush) (6/\(timesPerDay))" : "Don't miss your 6th Brush of the Day! (6/\(timesPerDay))", badge: 1, hour: hour, minute: minute)
        }
        
    }
    
    
    func scheduleNotification(title: String, body: String, badge: UInt,hour: Int, minute: Int) {
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
