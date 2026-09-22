MindMateAI
MindMateAI is a privacy-focused iOS wellness application built with SwiftUI. It helps users record their daily moods, write journal entries, view mood history and trends, receive positive encouragement, and schedule daily reflection reminders.

Note: This project was created as a portfolio project to demonstrate iOS development skills, UI design, data persistence, and Apple platform technologies.

Features
Personalised onboarding experience
Local username and password storage using Keychain
Daily mood check-ins
Mood history with emoji, messages, and timestamps
Mood trend visualisation using Apple Charts
Personal journaling with Core Data persistence
Daily encouragement based on the selected mood
Feedback rating for encouragement messages
Configurable daily journal reminders
Profile and sign-out functionality
Local data storage without requiring a remote server
Screenshots
Add screenshots of the application here:

Home	Mood Check-in	Journal
Add image here	Add image here	Add image here
Mood History	Mood Trends	Settings
Add image here	Add image here	Add image here
Technologies
Swift
SwiftUI
Core Data
Apple Charts
Keychain Services
UserNotifications
Swift Testing
XCTest
Project Structure
MindMateAIApp/
├── MindMateAIApp/
│   ├── ContentView.swift
│   ├── MindMateAIAppApp.swift
│   ├── JournalEntry.swift
│   ├── MoodHistoryView.swift
│   ├── MoodTrendView.swift
│   ├── Helpers/
│   │   ├── KeychainHelper.swift
│   │   └── NotificationManager.swift
│   ├── Persistence/
│   │   └── Persistence.swift
│   └── Views/
│       ├── EncouragementView.swift
│       ├── HomeView.swift
│       ├── JournalView.swift
│       ├── Mood.swift
│       ├── OnboardingView.swift
│       ├── ProfileView.swift
│       └── SettingsView.swift
├── MindMateAIAppTests/
├── MindMateAIAppUITests/
└── MindMateAIApp.xcodeproj/
Requirements
macOS
Xcode 16 or later
iOS 18.0 or later
An iPhone simulator or physical iOS device
Getting Started
Clone the repository:

git clone https://github.com/Kasidej31-bit/MindMateAI.git
Open the Xcode project:

cd MindMateAI
open MindMateAIApp/MindMateAIApp.xcodeproj
Select the MindMateAIApp scheme.

Choose an iOS 18 simulator or connected iPhone.

Press Run in Xcode.

How It Works
Mood tracking
Users select a mood from the available options. The app saves the selected mood, emoji, message, and timestamp to Core Data.

Journaling
Users can write personal journal entries. Journal entries are stored locally using Core Data and displayed in reverse chronological order.

Mood insights
The application displays saved moods in a history list and provides a visual trend chart using Apple Charts.

Reminders
Users can select a preferred reminder time. The app uses UserNotifications to schedule a daily local notification encouraging the user to complete a journal entry.

Local storage
The application uses:

Core Data for journal entries and mood records
AppStorage for lightweight app preferences such as username and reminder settings
Keychain Services for local credential storage
Privacy
MindMateAI is designed as a local-first prototype. Mood records and journal entries are stored locally on the device and are not sent to a remote server.

This project does not currently include:

Cloud synchronisation
Remote user accounts
Password recovery
Server-side authentication
End-to-end encryption
Medical or clinical functionality
The application is intended for personal reflection and is not a replacement for professional mental-health advice or emergency services.

Testing
The project includes unit-test and UI-test targets.

To run the tests in Xcode:

Open the project.
Select Product > Test.
Review the results in the Test Navigator.
Future tests could cover:

Mood selection and persistence
Journal validation
Empty journal states
Reminder scheduling
Login and sign-out behaviour
Mood trend calculations
Data deletion
Known Limitations
This is a portfolio prototype and has several areas that could be improved for production use:

Authentication is currently local to the device.
There is no remote account system or password recovery.
Journal and mood entries do not yet support editing.
Data export and complete account deletion could be improved.
More automated unit and UI tests are needed.
Accessibility and localisation can be expanded.
Mood chart values are simplified for demonstration purposes.
The application currently uses local notifications only.
Future Improvements
Planned improvements include:

Add Face ID or Touch ID app protection
Improve authentication and account management
Add editing and deleting for journal entries
Add a complete “delete my data” feature
Improve mood analytics and chart design
Add accessibility labels and VoiceOver support
Add localisation support
Add more unit and UI tests
Add an improved dashboard
Add a professional app icon and launch screen
Add data export functionality
Add crisis-support and wellbeing resources
Add continuous integration with GitHub Actions
What I Learned
This project helped me practise:

Building interfaces with SwiftUI
Structuring a multi-screen iOS application
Managing application state with @State, @AppStorage, and environment values
Persisting data with Core Data
Working with Keychain Services
Scheduling local notifications
Creating charts with Apple Charts
Designing reusable user flows
Writing unit and UI test foundations
Considering privacy and accessibility in app design
Author
Developed by Kasidej31-bit as a junior iOS development portfolio project.

License
This project is currently intended for educational and portfolio purposes.
