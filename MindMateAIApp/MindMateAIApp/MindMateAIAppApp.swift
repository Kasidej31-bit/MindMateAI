import SwiftUI

@main
struct MindMateAIApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("username") var username: String = ""
    @AppStorage("reminderHour") var reminderHour: Int = 9
    @AppStorage("reminderMinute") var reminderMinute: Int = 0

    var body: some Scene {
        WindowGroup {
            if username.isEmpty {
                OnboardingView()
            } else {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .onAppear {
                        NotificationManager.shared.requestPermission()
                        NotificationManager.shared.scheduleDailyReminder(hour: reminderHour, minute: reminderMinute)
                    }
            }
        }
    }
}

