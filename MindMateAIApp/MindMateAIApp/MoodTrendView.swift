//
//  MoodTrendView.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 22/04/2025.
//


import SwiftUI
import Charts
import CoreData

struct MoodTrendView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MoodEntry.timestamp, ascending: true)],
        animation: .default
    )
    private var moodEntries: FetchedResults<MoodEntry>

    var body: some View {
        NavigationView {
            VStack {
                if moodEntries.isEmpty {
                    Text("No mood data yet.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    Chart {
                        ForEach(moodEntries) { entry in
                            if let date = entry.timestamp, let mood = entry.moodName {
                                LineMark(
                                    x: .value("Date", date),
                                    y: .value("Mood Level", moodValue(for: mood))
                                )
                                .foregroundStyle(by: .value("Mood", mood))
                                .interpolationMethod(.catmullRom)
                            }
                        }
                    }
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day)) {
                            AxisValueLabel(format: .dateTime.month().day())
                        }
                    }
                    .frame(height: 300)
                    .padding()
                }

                Spacer()
            }
            .navigationTitle("Mood Trend")
        }
    }

    // Mood names mapped to numeric levels for chart
    func moodValue(for mood: String) -> Int {
        switch mood {
        case "Happy": return 5
        case "Excited": return 4
        case "Tired": return 3
        case "Anxious": return 2
        case "Sad", "Angry": return 1
        default: return 0
        }
    }
}
