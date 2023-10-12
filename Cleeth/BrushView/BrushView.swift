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
                    .padding(.bottom,35.0)
                
                    
                Spacer()
                
                ClockLabel()
                    .padding(.bottom,-25)
                
                ZStack(){
                    
                    TeethStructure()
                    
                    PlayRepeatButtons()
                    
                }
            }
        }
        .toolbar(self.brushTimeModel.hideTabBar ? .hidden : .visible, for: .tabBar)
    }
}

#Preview {
    BrushView().environmentObject(BrushTimeModel())
}
