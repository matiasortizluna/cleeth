//
//  InformationView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 16/02/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @EnvironmentObject var brushTimeModel : BrushModel
    @State var time : Int = UserDefaults.standard.integer(forKey: "clockDefaultValue")/60
    @Environment(\.requestReview) var requestReview
    
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
                    self.brushTimeModel.setNewValueForClock(new_value: self.time*60)
                })
                
                Section(header: Text("Brush Options")) {
                    
                    NavigationLink(destination: NotificationsView()){
                        HStack{
                            Image(systemName: "bell.badge")
                                .foregroundStyle(Color(.cleethGreen))
                            Text("Notifications")
                        }
                    }
                    
                    SyncCalendarView()
                    
                }
                
                Section(header: Text("Information")) {
                    
                    NavigationLink(destination: AboutView()){
                        HStack{
                            Image(systemName: "info.circle")
                                .foregroundStyle(Color(.cleethGreen))
                            Text("About")
                        }
                        .foregroundStyle(Color.primary)
                    }
                    
                    NavigationLink(destination: PrivacyPolicyView()){
                        HStack{
                            Image(systemName: "person.crop.circle")
                                .foregroundStyle(Color(.cleethGreen))
                            Text("Privacy Policy")
                        }
                        .foregroundStyle(Color.primary)
                    }
                    
                    
                    
                    HStack{
                        Button(action: {
                            requestReview()
                        }, label: {
                            HStack{
                                Image(systemName: "star")
                                    .foregroundStyle(Color(.cleethGreen))
                                Text("Evaluate")
                            }
                        })
                        .foregroundStyle(Color.primary)
                    }
                    
//                    HStack{
//                        
//                        ShareLink(items: [URL(string: "https://www.hackingwithswift.com")!], subject: Text("Check this Out!"), message: Text("Forget about forgetting to brush your teeth! Download Cleeth now in the App Store") ,label: {
//                            HStack{
//                                Image(systemName: "square.and.arrow.up")
//                                    .foregroundStyle(Color(.cleethGreen))
//                                Text("Share")
//                            }
//                            .foregroundStyle(Color.primary)
//                        })
//                    }
                    
                    //                    HStack{
                    //                        Button(action: {
                    //                            print("Button Share Email tapped")
                    //                        }, label: {
                    //                            HStack{
                    //                                Image(systemName: "bubble.right")
                    //                                Text("Feedback and Support")
                    //                            }
                    //                        })
                    //
                    //                    }
                }
                
                Section(header: Text("Reset Options")){
                    
                    //ClearStatisticsView()
                    
                    ClearCalendarEventsView()
                }
                
                Section(){
                    
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text("1.1")
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
            .environmentObject(BrushModel())
            .environmentObject(NotificationModel())
    }
}

