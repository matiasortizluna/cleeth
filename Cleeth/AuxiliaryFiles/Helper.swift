//
//  HelpFunctions.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 17/11/23.
//

import Foundation
import UserNotifications


class Helper {
    
    static var notificationsPerDay : Int = 2
    
    static func getNotificationsPerDay() -> Int {
        return self.notificationsPerDay
    }
    
    static func requestNotificationsPermission() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                print("Perfect, all worked.")
            } else if let error {
                print("Notification access not granted.", error.localizedDescription)
            }
        })
        
        
        
    }
    
    static func checkIfNotificationsPermission() -> Bool{
        var notificationsAuthStatus : Bool = false
        
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { (settings) -> Void in
            notificationsAuthStatus = (settings.authorizationStatus == .authorized)
            print(settings.authorizationStatus == .authorized)
        })
        
        return notificationsAuthStatus
        
    }
}
