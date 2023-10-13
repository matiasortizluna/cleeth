//
//  PlayButton.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 11/10/23.
//

import SwiftUI

struct PlayRepeatButtons: View {
    
    @EnvironmentObject var brushTimeModel : BrushTimeModel
    
    var body: some View {
        
        
        Button(action: {
            
            if (brushTimeModel.play){
                
                print("Stop Tapped")
                
                self.brushTimeModel.animateBrushView.toggle()
                
                self.brushTimeModel.animateStop.toggle()
                
                self.brushTimeModel.restartClock()
                
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: {_ in
                    self.brushTimeModel.animateStop.toggle()
                })
                
            }else{
                
                print("Play Tapped")
                
                self.brushTimeModel.startClock()
                
                self.brushTimeModel.animateBrushView.toggle()
                
                self.brushTimeModel.timer = Timer.scheduledTimer(withTimeInterval: 0.975, repeats: true){ timer in
                    if (self.brushTimeModel.clock == 0){
                        
                        self.brushTimeModel.finishedClock()
                        
                    }else{
                        self.brushTimeModel.clock -= 1
                        print(self.brushTimeModel.clock)
                        
                        if (self.brushTimeModel.clock == 0){
                            self.brushTimeModel.finishedClock()
                            
                            self.brushTimeModel.animateFinish.toggle()
                            Timer.scheduledTimer(withTimeInterval: 2.75, repeats: false, block: {_ in
                                                self.brushTimeModel.animateFinish.toggle()
                                            })
                            self.brushTimeModel.animateBrushView.toggle()
                                    
                            
                        }
                        
                    }
                    
                    
                }
                
            }
            
        }, label: {
            Image(systemName: brushTimeModel.play ? "stop.fill" : "play.fill")
                .animation(.easeInOut(duration: 0.2))
                .font(.system(size: 70.0))
                .foregroundStyle(Color(.cleethGreen))
                .overlay(content: {
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundStyle(self.brushTimeModel.animateStop ? Color(.red) : Color(.cleethDarkGreen))
                        .opacity(self.brushTimeModel.animateStop ? 1.0 : 0.2)
                })
            
        })
        
    }
    
}

#Preview {
    PlayRepeatButtons().environmentObject(BrushTimeModel())
}
