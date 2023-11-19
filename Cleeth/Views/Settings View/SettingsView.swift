//
//  InformationView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI

struct SaveDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}

struct SettingsView: View {
    
    @EnvironmentObject var brushTimeModel : BrushViewModel
    @EnvironmentObject var notificationViewModel : NotificationViewModel
    
    @State private var time : Int = 2
    
    private var eventModel : EventModel = EventModel()
    @State private var showingDialogEventCalendar : Bool = false
    
    @State private var showingDialogClearStatistics : Bool = false
    
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
                    
                    HStack{
                        
                        
                        Button(action: {
                            // What should happen when the button is tapped
                            print("Button tapped!")
                            self.eventModel.requestAccess()
                            self.eventModel.addEventToCalendar()
                            self.showingDialogEventCalendar.toggle()
                            
                        }) {
                            // What the button looks like
                            HStack(){
                                Image(systemName: "calendar")
                                Text("Sincronize with Calendar")
                                    .foregroundStyle(Color.primary)
                                
                            }
                        }
                        .confirmationDialog("Are you sure you want to add Events to Brush Your Teeth to your Calendar?", isPresented: self.$showingDialogEventCalendar, titleVisibility: .visible, actions: {
                            
                            Button("Yes") {
                                print("Yes")
                            }
                            .keyboardShortcut(.defaultAction)
                            
                            Button("Cancel", role: .cancel) {
                                print("No")
                            }
                        }, message: {
                            Text("Hello")
                        })
                        
                        
                    }
                    
                    //                    HStack{
                    //                        Image(systemName: "moon.circle")
                    //                        Text("Dark mode")
                    //                    }
                    
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
                            self.showingDialogClearStatistics.toggle()
                        }){
                            HStack{
                                Image(systemName: "trash")
                                Text("Clear Statistics")
                            }
                        }
                        .foregroundColor(.red)
                        .confirmationDialog("Are you sure you want to add Events to Brush Your Teeth to your Calendar?", isPresented: self.$showingDialogClearStatistics, titleVisibility: .visible, actions: {
                            
                            Button("Yes") {
                                print("Yes")
                            }
                            
                            Button("Yes, Delete All", role: .destructive) {
                                                            print("Yes")
                                                        }
                                                        .keyboardShortcut(.defaultAction)
                            
                            Button("Cancel", role: .cancel) {
                                print("No")
                            }
                        }, message: {
                            Text("Hello")
                        })
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
