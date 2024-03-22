//
//  BrushTimeModel.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 17/11/23.
//

import Foundation

class BrushModel : ObservableObject {
    
    @Published var timer = Timer()
    
    @Published var clockDefaultValue = UserDefaults.standard.integer(forKey: "clockDefaultValue")
    @Published var clockCurrentValue = UserDefaults.standard.integer(forKey: "clockCurrentValue")
    
    @Published var fillTopTeethBar: CGFloat = 0.5
    @Published var fillBottomTeethBar: CGFloat = 0.0
    
    @Published var playStopButton: Bool = false
    
    @Published var animatePlay : Bool = false
    @Published var animateStop : Bool = false
    @Published var animateFinish : Bool = false
    
    @Published var hideTabBar: Bool = false
    
    func restartClock() {
        self.playStopButton.toggle()
        
        self.fillTopTeethBar = 0.5
        self.fillBottomTeethBar = 0.0
        
        self.timer.invalidate()
        self.clockCurrentValue = self.clockDefaultValue
        
        self.hideTabBar.toggle()
    }
    
    func startClock() {
        self.playStopButton.toggle()
        
        self.fillTopTeethBar = 1.0
        self.fillBottomTeethBar = 0.5
        
        self.hideTabBar.toggle()
    }
    
    func finishClock() {
        self.restartClock()
        self.hideTabBar.toggle()
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: {_ in
            self.hideTabBar.toggle()
        })
    }
    
    func setNewValueForClock(new_value : Int) {
        self.clockDefaultValue = new_value
        self.clockCurrentValue = self.clockDefaultValue
        UserDefaults.standard.set(self.clockDefaultValue, forKey: "clockDefaultValue")
        UserDefaults.standard.set(self.clockCurrentValue, forKey: "clockCurrentValue")
    }
    
    func secondsToMinutesSeconds() -> (Int, Int) {
        return ((self.clockCurrentValue % 3600) / 60, (self.clockCurrentValue % 3600) % 60)
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
        if (second == 0) {
            return "00"
        }
        if (second < 10) {
            return "0\(second)"
        }
        return "\(second)"
    }
}
