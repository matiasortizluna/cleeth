//
//  InformationView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var brushTimeModel : BrushModel
    @State var time : Int = UserDefaults.standard.integer(forKey: "clockDefaultValue")
    
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
                .onChange(of: self.time, {
                    self.brushTimeModel.setNewValueForClock(new_value: self.time)
                })
                
                Section(header: Text("Options")) {
                    
                    NavigationLink(destination: NotificationsView()){
                        HStack{
                            Image(systemName: "bell.badge")
                                .foregroundStyle(Color(.cleethGreen))
                            Text("Notifications")
                        }
                    }
                    
                    SyncCalendarView()
                    
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
                    
                    ClearStatisticsView()
                    
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
            .environmentObject(BrushModel())
            .environmentObject(NotificationModel())
    }
}

