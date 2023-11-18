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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(brushTimeModel)
                .environmentObject(notificationViewModel)
        }
    }
    
}
