//
//  SettingsView.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 22/04/2025.
//


import SwiftUI

struct SettingsView: View {
    @AppStorage("reminderHour") var reminderHour: Int = 9
    @AppStorage("reminderMinute") var reminderMinute: Int = 0

    @State private var selectedTime = Date()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Set Daily Reminder Time")
                    .font(.headline)

                DatePicker("Reminder Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()

                Button("Save Reminder Time") {
                    let calendar = Calendar.current
                    reminderHour = calendar.component(.hour, from: selectedTime)
                    reminderMinute = calendar.component(.minute, from: selectedTime)

                    NotificationManager.shared.scheduleDailyReminder(hour: reminderHour, minute: reminderMinute)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .onAppear {
                var components = DateComponents()
                components.hour = reminderHour
                components.minute = reminderMinute
                selectedTime = Calendar.current.date(from: components) ?? Date()
            }
            .navigationTitle("Settings")
        }
    }
}
