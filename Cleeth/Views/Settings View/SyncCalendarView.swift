//
//  SyncCalendarView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 19/11/23.
//

import SwiftUI

struct SyncCalendarView: View {
    
    var eventModel : EventModel = EventModel()
    @State var showingDialogEventCalendar : Bool = false
    
    var body: some View {
        Button(action: {
            print("Button tapped!")
            self.eventModel.requestAccess()
            self.showingDialogEventCalendar.toggle()
            
        }) {
            HStack{
                Image(systemName: "calendar")
                    .foregroundStyle(Color(.cleethGreen))
                Text("Sync with Calendar")
                    .foregroundStyle(Color.primary)
            }
            
        }
        .confirmationDialog("Do you want to Sync with Calendar?", isPresented: self.$showingDialogEventCalendar, titleVisibility: .visible, actions: {
            
            Button("Yes, Sync Now") {
                print("Sync with Calendar")
                //self.eventModel.deleteEvents()
                self.eventModel.addEventsToCalendar()
            }
            .keyboardShortcut(.defaultAction)
            
            //Button("Yes, but let me Configure") {}
            
            Button("Cancel", role: .cancel) {
                print("Cancel Sync with Calendar")
            }
        }, message: {
            Text("Cleeth will create Events for each time of the day you set to be reminded to Brush your Teeth on your Calendar. \n\n Note: Previous Events set up will be Deleted and Replaced with the new configuration")
        })
    }
}


struct SyncCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SyncCalendarView()
            .environmentObject(BrushModel())
            .environmentObject(NotificationModel())
    }
}
