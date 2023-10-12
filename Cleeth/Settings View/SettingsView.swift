//
//  InformationView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            
                List(){
                    
                    Section(header: Text("More")) {
                        
                        NavigationLink(destination: NotificationsView()){
                            HStack{
                                Image(systemName: "bell.badge")
                                Text("Notifications")
                            }
                            
                        }
                        
                        HStack{
                            Image(systemName: "calendar")
                            Text("Sincronize with Calendar")
                        }
                        
                        HStack{
                            Image(systemName: "moon.circle")
                            Text("Dark mode")
                        }
                        
                    }
                    //.headerProminence(.increased)
                    
                    Section(header: Text("About")) {
                        
                        HStack{
                            Image(systemName: "info.circle")
                            Text("About")
                        }
                        
                        HStack{
                            Image(systemName: "square.and.arrow.up")
                            Text("Recommend")
                        }
                        
                        
                        HStack{
                            Image(systemName: "star")
                            Text("Evaluate")
                        }
                        
                        HStack{
                            Image(systemName: "bubble.right")
                            Text("Feedback and Support")
                        }
                        
                        
                        HStack{
                            Image(systemName: "creditcard")
                            Text("Donations")
                        }
                        
                    }
                    
                    Section(){
                        ZStack{
                            Button(action: {
                                print("Clear Statistics button pressed")
                            }){
                                HStack{
                                    Image(systemName: "trash")
                                    Text("Clear Statistics")
                                }
                            }
                            .foregroundColor(.red)
                        }
                    }
                    
                }
                .listStyle(.insetGrouped)
                
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


