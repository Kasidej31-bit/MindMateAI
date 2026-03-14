//
//  ContentView.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 20/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        withAnimation(.easeInOut(duration: 0.25)) {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                JournalView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                
                EncouragementView()
                    .tabItem {
                        Label("Encouragement", systemImage: "sparkles")
                    }
                
                MoodSelectionView()
                    .tabItem {
                        Label("Mood", systemImage: "face.smiling")
                    }
                
                MoodHistoryView()
                    .tabItem {
                        Label("History", systemImage: "clock")
                    }
                
                MoodTrendView()
                    .tabItem {
                        Label("Trend", systemImage: "chart.line.uptrend.xyaxis")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                
            }
        }
    }
}
