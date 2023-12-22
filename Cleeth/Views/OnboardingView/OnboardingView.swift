//
//  OnboardingView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 22/12/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboardingView : Bool
    
    var body: some View {
        
        TabView(content: {
            Text("1st View")
                .foregroundStyle(Color.red)
            
            Text("2nd View")
                .foregroundStyle(Color.blue)
            
            Text("3rd View")
                .foregroundStyle(Color.green)
            
            Text("4th View")
                .foregroundStyle(Color.yellow)
            
        }).tabViewStyle(PageTabViewStyle())
        
        
        Text("This is the Onboarding View")
        
        Button(action: {
            self.showOnboardingView = false
        }, label: {
            Text("Press to Dismiss")
        })
        
    }
}


#Preview {
    OnboardingView(showOnboardingView: .constant(true))
}
