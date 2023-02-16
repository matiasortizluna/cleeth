//
//  ContentView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 12/04/2022.
//

import SwiftUI

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


struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar")
                }
            
            BrushView()
                .tabItem {
                    Label("Brush", systemImage: "face.smiling")
                }
            
            InformationView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
            
        }
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

