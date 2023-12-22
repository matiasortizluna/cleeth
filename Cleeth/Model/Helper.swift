//
//  Helper.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 23/11/23.
//

import Foundation
import UserNotifications
import MessageUI

class Helper {
    
    static func requestNotificationsPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    print("Notification permission granted")
                    UserDefaults.standard.setValue(true, forKey: "notificationsProvided")
                } else if let error = error {
                    print("Error requesting notification permission: \(error.localizedDescription)")
                    UserDefaults.standard.setValue(false, forKey: "notificationsProvided")
                } else {
                    print("Notification permission denied")
                    UserDefaults.standard.setValue(false, forKey: "notificationsProvided")
                }
            }
        }
    }
    
    
    
}
