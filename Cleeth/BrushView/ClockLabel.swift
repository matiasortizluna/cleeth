//
//  ClockLabel.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 11/10/23.
//

import SwiftUI

struct ClockLabel: View {
    
    @EnvironmentObject var brushTimeModel : BrushTimeModel
    
    var body: some View {
        Text(self.brushTimeModel.convertDurationToString())
            .animation(.easeIn(duration: 0.2))
            .foregroundStyle(Color(.cleethGreen))
            .font(.system(size: 60.0)).bold()
            .overlay(content: {
                
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 200,height: 100)
                    .foregroundStyle(Color(.cleethDarkGreen))
                    .opacity(0.2)
                
            })
            
    }
}

#Preview {
    ClockLabel().environmentObject(BrushTimeModel())
}

