//
//  BrushView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct BrushView: View {
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    @State private var button : Bool = false
    @State private var buttonString : String = "Start"
    @State private var timeRunning : Bool = false
    
    private var minutes : [Int] = [60,120,180,240,300,360,420,480,540,600]
    
    var body: some View {
        
        VStack{
            //U+1FAA5
            Text("Cleeth \u{1FAA5}")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("Cleeth Green"))
                .padding(5)
            
            Text(timeString(time:stopWatchManager.timeRemaining))
                .frame(width: 200, height: 200, alignment: .center)
                .padding()
                .foregroundColor(Color("Cleeth Green"))
                .font(.system(size: 35.0))
                .overlay(
                    Circle()
                        .stroke(Color("Cleeth Green"), lineWidth: 5)
                        .padding(5)
                )
            
            VStack{
                
                HStack{
                    
                    if !self.timeRunning {
                        
                        Spacer()
                        
                        Button(action: {
                            if(timeRunning == false){
                                stopWatchManager.reduce()
                                print("-")
                            }
                        }){
                            Text("-")
                                .padding(2.0)
                                .font(.system(.title))
                                .frame(width: 50.0,height: 50.0)
                                .foregroundColor(Color("Cleeth Green"))
                                .background(.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color("Cleeth Green"), lineWidth: 3)
                                )
                        }
                        .padding(5.0)
                        
                        Spacer()
                        
                        Button(action: {
                            if(timeRunning == false){
                                stopWatchManager.add()
                                print("+")
                            }
                        }){
                            Text("+")
                                .padding(2.0)
                                .font(.system(.title))
                                .frame(width: 50.0,height: 50.0)
                                .foregroundColor(Color("Cleeth Green"))
                                .background(.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color("Cleeth Green"), lineWidth: 3)
                                )
                        }.padding(5.0)
                        
                        Spacer()
                        
                    }
                    
                }
                
                VStack{
                    
                    Button( action: {
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
                        
                    }){
                        Text(buttonString)
                            .padding(2.0)
                            .font(.system(.title2))
                            .frame(width: 250.0,height: 50.0)
                            .foregroundColor(.white)
                            .background(Color("Cleeth Green"))
                            .cornerRadius(40)
                    }
                    .padding(5.0)
                    
                    if !self.timeRunning {
                        Button(action: {
                            buttonString = "Start"
                            button = false
                            timeRunning = false
                            stopWatchManager.restart()
                        }){
                            Text("Restart")
                                .padding(2.0)
                                .font(.system(.title2))
                                .frame(width: 250.0,height: 50.0)
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(40)
                        }
                        .padding(5.0)
                    }
                }
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

struct BrushView_Previews: PreviewProvider {
    static var previews: some View {
        BrushView()
    }
}
