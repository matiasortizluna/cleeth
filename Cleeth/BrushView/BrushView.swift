//
//  BrushView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct BrushView: View {
    
    @EnvironmentObject var brushTimeModel : BrushTimeModel
    
    var body: some View {
        
        ZStack(){
            
            BackgroundView()
                .opacity(0.2)
                .ignoresSafeArea()
            
            
            VStack(){
                
                Spacer()
                
                Text("Cleeth")
                    .foregroundStyle(Color(.cleethGreen))
                    .font(.system(size: 40.0)).bold()
                
                Spacer()
                
                ClockLabel()
                    .padding(.bottom,-25)
                    .scaleEffect(self.brushTimeModel.animateBrushView ? 1.0 : 1.1)
                    .animation(self.brushTimeModel.animateBrushView ? Animation.easeInOut(duration: 1.0).repeatForever() :  Animation.easeOut(duration: 3.0), value: self.brushTimeModel.animateBrushView)
                
                ZStack(){
                    
                    TeethStructure()
                        .scaleEffect(self.brushTimeModel.animateBrushView ? 1.0 : 1.10)
                        .animation(self.brushTimeModel.animateBrushView ? Animation.easeInOut(duration: 1.0).repeatForever() :  Animation.easeOut(duration: 3.0), value: self.brushTimeModel.animateBrushView)
                        
                    
                        .rotationEffect(self.brushTimeModel.animateStop ?  .degrees(360) : .degrees(0))
                        .animation(self.brushTimeModel.animateStop ? Animation.easeIn(duration: 2.0) : Animation.easeIn(duration: 0.0), value: self.brushTimeModel.animateStop)
                    
                    PlayRepeatButtons()
                    
                }
                
                Spacer()
                
            }
            
            ZStack{
                
                Color(.cleethDarkGreen)
                    .opacity(1.0)
                
                Text("Congrats!")
                    .foregroundStyle(Color(.white))
                    .font(.system(size: 60.0)).bold()
                    .scaleEffect(self.brushTimeModel.animateFinish ? 1.0 : 1.30)
                    .animation(.bouncy(duration: 1.75), value: self.brushTimeModel.animateFinish)
                
                
            }.opacity(self.brushTimeModel.animateFinish ? 0.98 : 0)
            
        }
        .ignoresSafeArea(.all)
        .toolbar(self.brushTimeModel.hideTabBar ? .hidden : .visible, for: .tabBar).animation(.linear(duration: 0.1))
    }
}

#Preview {
    BrushView().environmentObject(BrushTimeModel())
}
