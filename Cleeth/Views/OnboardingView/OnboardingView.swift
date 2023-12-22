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
            OnboardingPage(title: "Cleeth's Goal", subtitle: "We want you to never forget to brush your teeth", description: "Let's find out how!", symbol: "face.smiling")
            
            OnboardingPage(title: "Brush Timer", subtitle: "Use the integrated timer to track the time for each brush", description: "Just click on the Play button", symbol: "play.circle.fill")
            
            OnboardingPage(title: "Default Timer", subtitle: "Change the default time for each brush ", description: "Set this up on Settings", symbol: "timer.circle.fill")
            
            OnboardingPage(title: "Push Notifications", subtitle: "Choose how many notifications you want to receive per day", description: "Set this up on Settings", symbol: "bell.badge.fill")
            
            OnboardingPage(title: "Sync with Calendar", subtitle: "Create events on your calendar for brushing your teeth", description: "Set this up on Settings", symbol: "calendar.circle.fill")
            
            ZStack(){
                OnboardingPage(title: "Feel Ready?",subtitle: "Let's start to create this new habit!", description: "", symbol: "checkmark.seal.fill")
                
                VStack(){
                    Spacer()
                    
                    Button(action: {
                        self.showOnboardingView = false
                    }, label: {
                        
                        ZStack(){
                            
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 200,height: 60)
                                .foregroundStyle(Color(. cleethGreen))
                            
                            Text("Get Started!")
                                .foregroundStyle(Color(.white))
                                .font(.system(size: 20.0)).bold()
                                .bold()
                                .padding(20.0)
                            
                        }
                    })
                    .padding(.bottom,75.0)
                    
                }
            }
            
        })
        .tabViewStyle(PageTabViewStyle())
        
    }
}

struct OnboardingPage : View {
    
    var title: String
    var subtitle: String
    var description: String
    var symbol: String
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Text(title)
                .foregroundStyle(Color(.white))
                .font(.largeTitle)
                .bold()
                .padding(.top, 100.0)
                .padding([.trailing,.leading],30.0)
            
            Text(subtitle)
                .foregroundStyle(Color(.white))
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 20.0)
                .padding([.trailing,.leading],50.0)
            
            Spacer()
            
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color(.cleethGreen))
                .padding(.top, -100.0)
                .padding([.leading,.trailing], 100.0)
            
            Text(description)
                .foregroundStyle(Color(.white))
                .font(.title3)
                .bold()
                .italic()
                .multilineTextAlignment(.center)
                .padding(.top, 50.0)
                .padding([.trailing,.leading],50.0)
            
            Spacer()
            
        }
    }
}

#Preview {
    OnboardingView(showOnboardingView: .constant(true))
}
