//
//  MoodHistoryView.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 22/04/2025.
//


import SwiftUI
import CoreData

struct MoodHistoryView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MoodEntry.timestamp, ascending: false)],
        animation: .default)
    private var moodEntries: FetchedResults<MoodEntry>

    var body: some View {
        NavigationView {
            List {
                ForEach(moodEntries) { entry in
                    HStack(alignment: .top, spacing: 12) {
                        Text(entry.emoji ?? "🙂")
                            .font(.largeTitle)
                            .frame(width: 40)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(entry.moodName ?? "")
                                .font(.headline)

                            Text(entry.message ?? "")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            if let date = entry.timestamp {
                                Text(date, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Mood History")
        }
    }
}
