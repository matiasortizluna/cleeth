//
//  CalendarModel.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 19/11/23.
//

import Foundation
import EventKit
import EventKitUI

class EventModel {
    
    let eventStore  = EKEventStore()
    
    
    func requestAccess() -> Void {
        
        eventStore.requestFullAccessToEvents(completion: {success, error in
            if success, error == nil {
                print("Access has been granted.")
            }  
        })
    }
    
    
    func addEventToCalendar() -> Void {
        
        let newEvent = EKEvent(eventStore: self.eventStore)
        newEvent.calendar = eventStore.defaultCalendarForNewEvents
        newEvent.title = "Time to Brush Your Teeth"
        newEvent.startDate = Date()
        newEvent.endDate = Calendar.current.date(byAdding: DateComponents(minute: 15), to: newEvent.startDate)
        
        let alarm = EKAlarm(relativeOffset: TimeInterval(-60 * 5))
        newEvent.addAlarm(alarm)
        
        do {
            try eventStore.save(newEvent, span: .thisEvent)
        } catch {
            print("Error saving event in calendar")             }
    }
    
    func checkEventExists(store: EKEventStore, event eventToAdd: EKEvent) -> Bool {
        
        let predicate = store.predicateForEvents(withStart: eventToAdd.startDate, end: eventToAdd.endDate, calendars: nil)
        let existingEvents = eventStore.events(matching: predicate)
        
        let exists = existingEvents.contains { (event) -> Bool in
            return eventToAdd.title == event.title && event.startDate == eventToAdd.startDate && event.endDate == eventToAdd.endDate
        }
        return exists
    }
    
    
}
