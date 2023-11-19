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
    
    func addEventsToCalendar() -> Void {
        
        let timesPerDay : Int = UserDefaults.standard.integer(forKey: "timesPerDay")
        let duration : Int = UserDefaults.standard.integer(forKey: "clockDefaultValue")
        
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
        newEvent.startDate = Calendar.current.date(from: DateComponents(hour: startHour, minute: startMinute))
        
        newEvent.endDate = Calendar.current.date(byAdding: DateComponents(minute: duration), to: newEvent.startDate)
        
        let alarm = EKAlarm(relativeOffset: TimeInterval(-60 * 5))
        newEvent.addAlarm(alarm)
        
        //EKRecurrenceEnd(end: Calendar.current.date(from: DateComponents(day: 2))!
        //let recurrenceRule = EKRecurrenceRule(recurrenceWith: EKRecurrenceFrequency.daily, interval: 1, end: nil)
        //newEvent.recurrenceRules = [recurrenceRule]
        
        do {
            try eventStore.save(newEvent, span: .thisEvent)
        } catch let e as NSError {
            print("Error saving event in calendar. \(e)")
            return
        }
        
        
        
    }
    
    func deleteEvents() -> Void {
        
        let eventStore = EKEventStore()
        
        let predicate = eventStore.predicateForEvents(withStart: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1))!, end: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1))!, calendars: [eventStore.defaultCalendarForNewEvents!])
        let existingEvents = eventStore.events(matching: predicate)
        
        print(existingEvents.count)
        
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
