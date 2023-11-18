//
//  ContentView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView(selection: .constant(2)){
            
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar")
                }
                .tag(1)
                
            
            BrushView()
                .tabItem {
                    Label("Brush", systemImage: "face.smiling")
                }.tag(2)
            
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
            
        }
        .accentColor(Color(.cleethGreen))
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BrushViewModel())
            .environmentObject(NotificationViewModel())
    }
}

