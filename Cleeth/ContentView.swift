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
            if(self.timeRemaining != 1){
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
        if(self.timeRemaining != 1){
            self.timeRemaining += 60
        }
    }
    
    func reduce(){
        if(self.timeRemaining != 1){
            self.timeRemaining -= 60
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    @State private var button : Bool = false
    @State private var buttonString : String = "Start"
    @State private var timeRunning : Bool = false
    
    private var minutes : [Int] = [60,120,180,240,300,360,420,480,540,600]
    
    var body: some View {
        
        ZStack(){
            
            Color.white
            
            VStack(){
                
                Spacer()
                
                Text(timeString(time:stopWatchManager.timeRemaining))
                
                Spacer()
                
                Button(buttonString, action: {
                    if(button == false){
                        print("Start")
                        buttonString = "Stop"
                        stopWatchManager.start()
                        timeRunning.toggle()
                        button.toggle()
                    }else{
                        print("Stop")
                        buttonString = "Start"
                        stopWatchManager.stop()
                        timeRunning.toggle()
                        button.toggle()
                    }
                })
                
                Spacer()
                
                Button("Restart", action: {
                    buttonString = "Start"
                    button = false
                    timeRunning = false
                    stopWatchManager.restart()
                })
                
                Spacer()
                
                VStack(){
                    HStack(){
                    
                        Spacer()
                        
                        Button("+", action: {
                            if(timeRunning == false){
                                stopWatchManager.add()
                                print("+")
                            }
                        })
                        
                        Spacer()
                        
                        Button("-", action: {
                            if(timeRunning == false){
                                stopWatchManager.reduce()
                                print("-")
                            }
                        })
                        
                        Spacer()
                        
                    }
                    
                    HStack(){
                        Picker("", selection: $stopWatchManager.timeRemaining){
                            ForEach(minutes, id: \.self){
                                Text(timeStringPicker(time:$0))
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
                
                Spacer()
                
            }
            
        }
        
    }
    
    private func timeStringPicker(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = 0
        return String(format: "%02i : %02i", minutes, seconds)
    }
    
    private func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i : %02i", minutes, seconds)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
