//
//  ClearCalendarEventsView.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 20/11/23.
//

import SwiftUI

struct ClearCalendarEventsView: View {
    
    var eventModel : EventModel = EventModel()
    @State var showingDialogClearEventsFromCalendar : Bool = false
    
    var body: some View {
        ZStack{
            Button(action: {
                print("Clear Events from Calendar button pressed")
                self.showingDialogClearEventsFromCalendar.toggle()
            }){
                HStack{
                    Image(systemName: "trash")
                    Text("Clear Events from Calendar")
                }
            }
            .foregroundColor(.red)
            .confirmationDialog("Are you sure you want to delete all Events to Brush Your Teeth from your Calendar?", isPresented: self.$showingDialogClearEventsFromCalendar, titleVisibility: .visible, actions: {
                
                
                Button("Yes, Delete All", role: .destructive) {
                    print("Yes, Delete All Events from Calendar")
                    self.eventModel.deleteEvents()
                }
                .keyboardShortcut(.defaultAction)
                
                Button("Cancel", role: .cancel) {
                    print("No")
                }
            })
        }
    }
}

#Preview {
    ClearCalendarEventsView()
        .environmentObject(BrushModel())
        .environmentObject(NotificationModel())
}
