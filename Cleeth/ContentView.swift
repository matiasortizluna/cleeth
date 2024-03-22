//
//  ContentView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("showOnboardingView") var showOnboardingView : Bool = true
    
    var body: some View {
        TabView(selection: .constant(2)) {
            
            //            StatisticsView()
            //                .tabItem {
            //                    Label("Statistics", systemImage: "chart.bar")
            //                }
            //                .tag(1)
            //
            BrushView()
                .tabItem {
                    Label("Brush", systemImage: "face.smiling")
                }
                .tag(2)
            //.badge(12)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
        }
        .accentColor(Color(.cleethGreen))
        .fullScreenCover(
            isPresented: self.$showOnboardingView,
            content: {
                OnboardingView(showOnboardingView: self.$showOnboardingView)
                    .background(Color(.cleethDarkGreen))
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BrushModel())
            .environmentObject(NotificationModel())
    }
}
