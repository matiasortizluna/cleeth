//
//  CalendarModel.swift
//  Cleeth
//
//  Created by Matias Ariel Ortiz Luna on 19/11/23.
//

import Foundation
import EventKit

class EventModel {
    
    let eventStore  = EKEventStore()
    let todayDate : Date = Date()
    
    func requestAccess() {
        let status = EKEventStore.authorizationStatus(for: .event)
        if status == .authorized {
            print("EKEventStore access already granted.")
        } else {
            eventStore.requestFullAccessToEvents { success, error in
                if success && error == nil {
                    print("EKEventStore access has been granted.")
                } else {
                    print("EKEventStore access request failed with error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
    
    
    func addEventsToCalendar() -> Void {
        
        let timesPerDay : Int = UserDefaults.standard.integer(forKey: "timesPerDay")
        let duration : Int = UserDefaults.standard.integer(forKey: "clockDefaultValue")/60
        
        var date : Date = UserDefaults.standard.object(forKey: "date1") as! Date
        var hour : Int = 0
        var minute : Int = 0
        
        if(1 <= timesPerDay){
            hour = Calendar.current.component(.hour, from: date)
            minute = Calendar.current.component(.minute, from: date)
            self.addEventToCalendar(title: "Cleeth: 1st Brush Of The Day! (1/\(timesPerDay))", startHour: hour, startMinute: minute, duration: duration)
        }
        
        if(2 <= timesPerDay){
            date = UserDefaults.standard.object(forKey: "date2") as! Date
            hour = Calendar.current.component(.hour, from: date)
            minute = Calendar.current.component(.minute, from: date)
            self.addEventToCalendar(title: "Cleeth: 2nd Brush Of The Day! (2/\(timesPerDay))", startHour: hour, startMinute: minute, duration: duration)
        }
        
        if(3 <= timesPerDay){
            date = UserDefaults.standard.object(forKey: "date3") as! Date
            hour = Calendar.current.component(.hour, from: date)
            minute = Calendar.current.component(.minute, from: date)
            self.addEventToCalendar(title: "Cleeth: 3rd Brush Of The Day! (3/\(timesPerDay))", startHour: hour, startMinute: minute, duration: duration)
        }
        
        if(4 <= timesPerDay){
            date = UserDefaults.standard.object(forKey: "date4") as! Date
            hour = Calendar.current.component(.hour, from: date)
            minute = Calendar.current.component(.minute, from: date)
            self.addEventToCalendar(title: "Cleeth: 4th Brush Of The Day! (4/\(timesPerDay))", startHour: hour, startMinute: minute, duration: duration)
        }
        
        if(5 <= timesPerDay){
            date = UserDefaults.standard.object(forKey: "date5") as! Date
            hour = Calendar.current.component(.hour, from: date)
            minute = Calendar.current.component(.minute, from: date)
            self.addEventToCalendar(title: "Cleeth: 5th Brush Of The Day! (5/\(timesPerDay))", startHour: hour, startMinute: minute, duration: duration)
        }
        
        if(6 <= timesPerDay){
            date = UserDefaults.standard.object(forKey: "date6") as! Date
            hour = Calendar.current.component(.hour, from: date)
            minute = Calendar.current.component(.minute, from: date)
            self.addEventToCalendar(title: "Cleeth: 6th Brush Of The Day! (6/\(timesPerDay))", startHour: hour, startMinute: minute, duration: duration)
        }
    }
    
    func addEventToCalendar(title: String, startHour: Int, startMinute: Int, duration: Int) -> Void {
        
        let newEvent = EKEvent(eventStore: self.eventStore)
        newEvent.calendar = eventStore.defaultCalendarForNewEvents
        newEvent.title = title
        newEvent.startDate = Calendar.current.date(bySettingHour: startHour, minute: startMinute, second: 0, of: Date())
        newEvent.endDate = Calendar.current.date(bySetting: .minute, value: startMinute + duration, of: newEvent.startDate)
        
        let alarm = EKAlarm(relativeOffset: TimeInterval(-60 * 5))
        newEvent.addAlarm(alarm)
        
        let recurrenceRule = EKRecurrenceRule(recurrenceWith: EKRecurrenceFrequency.daily, interval: 1, end: EKRecurrenceEnd(end: Calendar.current.date(byAdding: .month, value: 1, to: newEvent.startDate)!))
        newEvent.recurrenceRules = [recurrenceRule]
        
        do {
            try eventStore.save(newEvent, span: .thisEvent)
        } catch let e as NSError {
            print("Error saving event in calendar. \(e)")
            return
        }
        
        
        
    }
    
    func deleteEvents() -> Void {
        
        let eventStore = EKEventStore()
        
        let predicate = eventStore.predicateForEvents(withStart: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 19))!, end: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 1))!, calendars: [eventStore.defaultCalendarForNewEvents ?? EKCalendar()])
        let existingEvents = eventStore.events(matching: predicate)
        
        for event in existingEvents {
            if event.title.contains("Cleeth"){
                do {
                    try eventStore.remove(event, span: .futureEvents)
                } catch let error as NSError {
                    print("Failed to save event with error : \(error)")
                }
                print("Removed Event")
            }else{
                print("Event does not start with Cleeth")
            }
        }
        
        
    }
    
}
