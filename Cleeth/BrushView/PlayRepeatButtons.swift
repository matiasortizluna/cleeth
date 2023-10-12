//
//  PlayButton.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 11/10/23.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        
        Button(action: {
            print("Play Tapped")
        }, label: {
            
            Image(systemName: "play.fill")
                .font(.system(size: 70.0))
                .foregroundStyle(Color(.cleethGreen))
                .overlay(content: {
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundStyle(Color(.gray))
                        .opacity(0.3)
                })
            
        })
        
        
    }
}

#Preview {
    PlayButton()
}
