//
//  CleethApp.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

@main
struct CleethApp: App {
    
    @StateObject var brushTimeModel = BrushModel()
    @StateObject var notificationViewModel = NotificationModel()
    
    @Environment(\.scenePhase) private var scenePhase
    
    init(){
        
        UserDefaults.standard.register(
            defaults: [
                "clockDefaultValue": 180,
                "clockCurrentValue": 180,
                "timesPerDay": 2,
                "date1" : Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!,
                "date2" : Calendar.current.date(bySettingHour: 20, minute: 0, second: 0, of: Date())!,
                "date3" : Date(),
                "date4" : Date(),
                "date5" : Date(),
                "date6" : Date()
            ]
        )
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(brushTimeModel)
                .environmentObject(notificationViewModel)
                .onAppear(perform: {
                    self.notificationViewModel.requestNotificationsPermission()
                })
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                UNUserNotificationCenter.current().setBadgeCount(0)
                self.notificationViewModel.setBadgeCount(newValue: 0)
            }
        }
        
    }
    
}
