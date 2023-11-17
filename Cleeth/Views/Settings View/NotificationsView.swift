//
//  NotificationsView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 17/02/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var timesPerDay : Int = 0
    @State var date : Date = Date()
    
    var body: some View {
        
        List(){
            
            Section(header: Text("Notifications Permissions")) {
                
                Button("Request Permission") {
                    print("Requesting Permission")
                    Helper.requestNotificationsPermission()
                }
                
            }
            
            Section(header: Text("Notifications Schedule")) {
                
                Picker("Times Per Day", systemImage: "timer", selection:  self.$timesPerDay, content: {
                    
                    ForEach(2..<6, id: \.self, content: {
                        Text("\($0) times")
                    })
                })
                
                ForEach(1...Helper.notificationsPerDay, id:\.self, content: {time in
                    
                    DatePicker("\(time) time: ", selection: self.$date)
                    
                })
                
            }
            
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.large)
        
    }
    
    
    
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}


