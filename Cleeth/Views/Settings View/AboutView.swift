//
//  AboutView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 20/11/23.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        ScrollView(.vertical){
            
            VStack(alignment: .leading){
                
                HStack{
                    Text(" What is Cleeth? 📱")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding([.leading,.trailing, .bottom],10)
                
                Text("🪥 Cleeth is an iOS application designed to help everyone (but specially children) in cultivating the habit of brushing their teeth. Cleeth ensures you don't forget to brush by sending notifications and integrating with calendar. This by also providing a simple interface and fun animations to accompany you in your journey.")
                    .font(.body)
                    .padding([.leading,.trailing, .bottom],10)
                
                
                
            }
            
            VStack(alignment: .leading){
                HStack{
                    Text("The Developer 🧑‍💻")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding([.leading,.trailing, .bottom],10)
                
                Text("Hi, I'm Matias Ortiz Luna, a 22 years old Computer Engineering Bachelor's graduate and Computer Science Master's student at the Faculty of Sciences of the University of Porto. I was born and raised in Ecuador but have been living in Portugal since 2018.\nI am very passionate about iOS development, Artificial Intelligence, Data Science and Network Science. I identify myself as a proud science nerd, but I'm also a volleyball player, passionate cook, and soon-to-be polyglot. Hoping to one day become Batman; currently, I'm Spiderman.\n\nYou can find me on LinkedIn and GitHub by searching for my full name. I would be happy to connect and exchange insights about any of these topics.")
                    .font(.body)
                    .padding([.leading,.trailing, .bottom],10)
                
                
            }
            
            VStack(alignment: .leading){
                
                HStack{
                    Text("Acknowledgements 🙏")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding([.leading,.trailing, .bottom],10)
                
                Text("The idea of creating \"Cleeth\" came to me in February 2023 during a challenging personal moment. To give myself a sense of purpose, I set the goal of publishing my first iOS app during that month. However, during this time and until recently, I took a break from programming to focus on personal growth. Today, I am proud to say that not only do I feel much better about myself, but I have also successfully published my first iOS app on the App Store in November 2023, this one. This achievement reflects my improved well-being and confidence, serving as a reminder that we must prioritize our own well-being so we can excell in our work so we could support others achieve great things to.\n\nFirstly, I want to express my gratitude to my family for their unwavering support, love, and care. They played a crucial role in shaping me into the person I am today.\n\nTo my friends and everyone who has been by my side through thick and thin, listening to all the crazy and seemingly foolish ideas that crossed my mind, thank you for supporting me and encouraging me to move forward, especially during times when I felt incapable.\n\nTo my ex-girlfriend, though we are no longer together, I still cherish the love we shared. Thank you for accepting me for who I am, believing in me, and seeing potential in me that I couldn't see in myself. Your support and trust were instrumental in my journey, and I wouldn't be here if it wasn't for you. I love you and will always do.\n\nLast but not least, I want to thank me, for always trying to do the right thing, eventhough when it was the hard thing to do. Thank you for embracing both your flaws and strengths, for accepting yourself, and feeling proud about it.\nThank you Matias, for having the strength to persevere and not give up on your dreams, but most importantly, not giving up on yourself during this past year.")
                    .font(.body)
                    .padding([.leading,.trailing, .bottom],10)
                
            }
            
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.large)
        .scrollIndicators(.visible, axes: .vertical)
        
    }
    
}

#Preview {
    AboutView()
}
