//
//  CleethApp.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

@main
struct CleethApp: App {
    
    @StateObject var brushTimeModel = BrushViewModel()
    @StateObject var notificationViewModel = NotificationViewModel()
    
    @Environment(\.scenePhase) private var scenePhase
    
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
