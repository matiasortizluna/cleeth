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
                "clockDefaultValue": 3,
                "clockCurrentValue": 3,
                "timesPerDay": 5
                
            ]
        )
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(brushTimeModel)
                .environmentObject(notificationViewModel)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                UNUserNotificationCenter.current().setBadgeCount(0)
                self.notificationViewModel.setBadgeCount(newValue: 0)
            }
        }
        
        
    }
    
}
