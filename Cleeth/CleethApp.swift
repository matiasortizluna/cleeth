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
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(brushTimeModel)
        }
    }
    
}
