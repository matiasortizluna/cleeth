//
//  InformationView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var brushTimeModel : BrushViewModel
    @EnvironmentObject var notificationViewModel : NotificationViewModel
    
    @State private var time : Int = 2
    
    var body: some View {
        
        NavigationView {
            
            List(){
                
                Section(header: Text("Time for Every Brush")) {
                    
                    Picker("Time", systemImage: "timer", selection:  self.$time, content: {
                        
                        ForEach(2..<11, id: \.self, content: {
                            Text("\($0) minutes")
                        })
                    })
                }
                .foregroundStyle(Color.primary)
                .onChange(of: self.time, {
                    self.brushTimeModel.setNewValueForClock(new_value: self.time)
                })
                
                Section(header: Text("Options")) {
                    
                    
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
                
                Section(header: Text("About")) {
                    
                    HStack{
                        Image(systemName: "info.circle")
                        Text("About")
                    }
                    
                    
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
                    
                    
                    HStack{
                        Image(systemName: "star")
                        Text("Evaluate")
                    }
                    
                    HStack{
                        Image(systemName: "bubble.right")
                        Text("Feedback and Support")
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
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
                .environmentObject(BrushViewModel())
                .environmentObject(NotificationViewModel())
        }
    }
    
    
}
