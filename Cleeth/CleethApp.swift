//
//  CleethApp.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

@main
struct CleethApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class StopWatchManager : ObservableObject{
    
    @Published var timeRemaining = 3*60
    
    var timer = Timer()
    
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            if(self.timeRemaining>=0 && self.timeRemaining<661){
                self.timeRemaining -= 1
            }
        })
    }
    
    func stop(){
        timer.invalidate()
    }
    
    func restart(){
        timer.invalidate()
        self.timeRemaining = 3*60
    }
    
    func add(){
        if(self.timeRemaining<600){
            self.timeRemaining += 60
        }
    }
    
    func reduce(){
        if(self.timeRemaining>61){
            self.timeRemaining -= 60
        }
    }
}
