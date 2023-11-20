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
                    Text("What is Cleeth?")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                }
                
                .padding([.leading,.bottom],10)
                
                Text("Butterflies play an essential role in the natural ecosystem as pollinators and as food for other animals in all stages of their life cycle. Their intricate relationships with plants and animals means that they are often the first to be endangered if an ecosystem’s delicate balance is disturbed. Thus, the occurrence of certain species and their numbers are often used as indicators of ecosystem health. Lepilens is an iOS application that aims to connect its users with nature and butterflies. Using Lepilens anyone can become an expert in Lepidoptera and make observations, organize, share and export them. Lepilens can classify 134 different species of butterflies that can be found in Portugal and across Europe.")
                    .font(.body)
                    .padding([.leading,.trailing,.bottom],10)
                
                
                
            }
            
            
            VStack(alignment: .trailing){
                HStack{
                    Text("The Developer")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                
                .padding([.leading,.bottom],10)
                
                Text("Hello! 🙂 My name is Tomás Santiago Mamede. I am 21 years old and I am a Portuguese student at the Faculty of Sciences of the University of Porto pursing a Master's Degree in Computer Science. In August 2020 I finished the Bachelor's Degree in Computer Science from the same institution. I love Computer Science and Science in general. The areas that I am most interested in are Artificial Intelligence, Human-Computer Interaction and Software Engineering. I enjoy working at the intersection of Computer Science, Science and the Humanities. I love running, playing tennis and listening to music.")
                    .font(.body)
                    .padding([.leading,.trailing,.bottom],10)
                
                
            }
            
            VStack(alignment: .trailing){
                
                HStack{
                    Text("Acknowledgements")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding([.leading,.bottom],10)
                
                Text("The idea of creating \"Cleeth\" came to me in February 2023 during a challenging personal moment. To give myself a sense of purpose, I purchased the Apple Developer Program license and set the goal of publishing my first iOS app. However, during this time and until recently, I took a break from programming to focus on personal growth. Today, I am proud to say that not only do I feel much better about myself, but I have also successfully published my first iOS app on the App Store. This achievement reflects my improved well-being and confidence, serving as a reminder that we must prioritize our own well-being so we can excell in our work so we could support others achieve great things to.\n\nFirstly, I want to express my gratitude to my family for their unwavering support, love, and care. They played a crucial role in shaping me into the person I am today.\n\nTo my friends and everyone who has been by my side through thick and thin, listening to all the crazy and seemingly foolish ideas that crossed my mind, thank you for supporting me and encouraging me to move forward, especially during times when I felt incapable.\n\nTo my ex-girlfriend, though we are no longer together, I still cherish the love we shared. Thank you for accepting me for who I am, believing in me, and seeing potential in me that I couldn't see in myself. Your support and trust were instrumental in my journey, and I wouldn't have progressed without them.\n\nLast but not least, I want to thank me,for always trying to do the right thing, eventhough when it was the hard thing to do. Thank you for embracing both your flaws and strengths, for accepting yourself, and feeling proud about it.\nThank you Matias, for having the strength to persevere and not give up on your dreams, but most importantly, not giving up on yourself during this past year.")
                    .font(.body)
                    .padding([.leading,.trailing,.bottom],10)
                
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
