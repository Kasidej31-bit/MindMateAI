//
//  NotificationManager.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 22/04/2025.
//


import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                print("✅ Notifications allowed")
            } else {
                print("❌ Notifications not allowed")
            }
        }
    }

    func scheduleDailyReminder(hour: Int, minute: Int) {
        cancelReminder() // Cancel existing one

        let content = UNMutableNotificationContent()
        content.title = "Daily Journal"
        content.body = "Take a moment to reflect. How are you feeling today?"
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "dailyJournalReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Error scheduling notification: \(error)")
            }
        }
    }


    func cancelReminder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyJournalReminder"])
    }
}
