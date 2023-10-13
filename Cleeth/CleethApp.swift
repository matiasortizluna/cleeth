//
//  CleethApp.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

class BrushTimeModel : ObservableObject {
    
    @Published var timer = Timer()
    // seconds
    @Published var clock_default_value = 3
    @Published var clock = 3
    
    @Published var play: Bool = false
    
    @Published var fill_top: CGFloat = 0.5
    @Published var fill_bottom: CGFloat = 0.0
    
    @Published var hideTabBar: Bool = false
    
    @Published var animateBrushView : Bool = false
    
    @Published var animateFinish : Bool = false
    @Published var animateStop : Bool = false
    
    func restartClock(){
        self.play.toggle()
        
        self.fill_top = 0.5
        self.fill_bottom = 0.0
        
        self.timer.invalidate()
        self.clock = self.clock_default_value
        
        self.hideTabBar.toggle()
    }
    
    func startClock(){
        self.play.toggle()
        
        self.fill_top = 1.0
        self.fill_bottom = 0.5
        
        self.hideTabBar.toggle()
        
    }
    
    func finishedClock(){
        self.restartClock()
        
        self.hideTabBar.toggle()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: {_ in 
            self.hideTabBar.toggle()
        })
        
    }
    
    func setNewValueForClock(new_value : Int){
        self.clock_default_value = new_value
        self.clock = self.clock_default_value
    }
    
    func secondsToMinutesSeconds() -> (Int, Int) {
        return ((self.clock % 3600) / 60, (self.clock % 3600) % 60)
    }
    
    
    public func convertDurationToString() -> String {
        let (minute, second) = self.secondsToMinutesSeconds()
        return "\(self.getMinute(minute: minute))\(self.getSecond(second: second))"
    }
    
    
    private func getMinute(minute: Int) -> String {
        if (minute == 0) {
            return "00:"
        }
        
        if (minute < 10) {
            return "0\(minute):"
        }
        
        return "\(minute):"
    }
    
    private func getSecond(second: Int) -> String {
        if (second == 0){
            return "00"
        }
        
        if (second < 10) {
            return "0\(second)"
        }
        return "\(second)"
    }
    
}

@main
struct CleethApp: App {
    
    @StateObject var brushTimeModel = BrushTimeModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(brushTimeModel)
        }
    }
    
}
