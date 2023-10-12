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
        
        if (brushTimeModel.play){
            Button(action: {
                print("Stop Tapped")
                self.brushTimeModel.restartClock()
                
            }, label: {
                
                Image(systemName: "stop.fill")
                    .font(.system(size: 70.0))
                    .foregroundStyle(Color(.cleethGreen))
                    .overlay(content: {
                        Circle()
                            .frame(width: 150, height: 150)
                            .foregroundStyle(Color(.cleethDarkGreen))
                            .opacity(0.2)
                    })
            })
            
        }else{
            
            
            Button(action: {
                print("Play Tapped")
                
                self.brushTimeModel.startClock()
                
                self.brushTimeModel.timer = Timer.scheduledTimer(withTimeInterval: 0.975, repeats: true){ timer in
                    if (self.brushTimeModel.clock == 0){
                        
                        self.brushTimeModel.finishedClock()
                        
                    }else{
                        self.brushTimeModel.clock -= 1
                        print(self.brushTimeModel.clock)
                    }
                    
                    
                }
                
            }, label: {
                
                Image(systemName: "play.fill")
                    .font(.system(size: 70.0))
                    .foregroundStyle(Color(.cleethGreen))
                    .overlay(content: {
                        Circle()
                            .frame(width: 150, height: 150)
                            .foregroundStyle(Color(.cleethDarkGreen))
                            .opacity(0.2)
                    })
            })
        }
        
        
    }
    
}

#Preview {
    PlayRepeatButtons().environmentObject(BrushTimeModel())
}
