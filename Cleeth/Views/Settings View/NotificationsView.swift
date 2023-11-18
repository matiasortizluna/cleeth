//
//  NotificationsView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 17/02/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @EnvironmentObject var notificationViewModel : NotificationViewModel
    
    var body: some View {
        
        List(){
            
            Section(header: Text("Notifications Permissions")) {
                
                Button("Request Permission") {
                    print("Requesting Permission")
                    Helper.requestNotificationsPermission()
                }
                
            }
            
            Section(header: Text("Notifications Schedule")) {
                
                Picker("Times Per Day", systemImage: "timer", selection:  self.$notificationViewModel.timesPerDay, content: {
                    
                    ForEach(2..<7, id: \.self, content: {
                        Text("\($0) times")
                    })
                })
                
                if(1 <= self.notificationViewModel.timesPerDay){
                    DatePicker("1st time: ", selection: self.$notificationViewModel.date1, displayedComponents: [.hourAndMinute])
                }
                
                if(2 <= self.notificationViewModel.timesPerDay){
                    DatePicker("2nd time: ", selection: self.$notificationViewModel.date2, displayedComponents: [.hourAndMinute])
                }
                
                if(3 <= self.notificationViewModel.timesPerDay){
                    DatePicker("3rd time: ", selection: self.$notificationViewModel.date3, displayedComponents: [.hourAndMinute])
                }
                
                if(4 <= self.notificationViewModel.timesPerDay){
                    DatePicker("4th time: ", selection: self.$notificationViewModel.date4, displayedComponents: [.hourAndMinute])
                }
                
                if(5 <= self.notificationViewModel.timesPerDay){
                    DatePicker("5th time: ", selection: self.$notificationViewModel.date5, displayedComponents: [.hourAndMinute])
                }
                
                if(6 <= self.notificationViewModel.timesPerDay){
                    DatePicker("6th time: ", selection: self.$notificationViewModel.date6, displayedComponents: [.hourAndMinute])
                }
                
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.large)
        .onChange(of: self.notificationViewModel.timesPerDay, {
            
            
            self.notificationViewModel.date1 = Calendar.current.date(from: DateComponents(hour: Helper.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.notificationViewModel.timesPerDay, time: 1)))!
            
            self.notificationViewModel.date2  = Calendar.current.date(from: DateComponents(hour: Helper.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.notificationViewModel.timesPerDay, time: 2)))!
            
            self.notificationViewModel.date3  = Calendar.current.date(from: DateComponents(hour: Helper.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.notificationViewModel.timesPerDay, time: 3)))!
            
            self.notificationViewModel.date4  = Calendar.current.date(from: DateComponents(hour: Helper.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.notificationViewModel.timesPerDay, time: 4)))!
            
            self.notificationViewModel.date5  = Calendar.current.date(from: DateComponents(hour: Helper.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.notificationViewModel.timesPerDay, time: 5)))!
            
            self.notificationViewModel.date6 = Calendar.current.date(from: DateComponents(hour: Helper.calculateTimesBasedOnNumberOfTimes(timesPerDay: self.notificationViewModel.timesPerDay, time: 6)))!
        })
        .onDisappear(perform: {
            
            self.notificationViewModel.scheduleLocalNotifications()
            
        })
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .environmentObject(NotificationViewModel())
    }
}


