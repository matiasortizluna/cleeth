//
//  HelpFunctions.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 17/11/23.
//

import Foundation
import UserNotifications


class Helper {
    
    static func calculateTimesBasedOnNumberOfTimes(timesPerDay: Int, time: Int) -> Int {
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
