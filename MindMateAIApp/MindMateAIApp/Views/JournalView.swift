import SwiftUI
import CoreData

struct JournalView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \JournalEntry.timestamp, ascending: false)],
        animation: .default)
    private var entries: FetchedResults<JournalEntry>

    @State private var newEntry = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $newEntry)
                    .padding()
                    .frame(height: 150)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button("Save Entry") {
                    let entry = JournalEntry(context: viewContext)
                    entry.text = newEntry
                    entry.timestamp = Date()
                    try? viewContext.save()
                    newEntry = ""
                }
                .buttonStyle(.borderedProminent)

                List {
                    ForEach(entries) { entry in
                        VStack(alignment: .leading) {
                            Text(entry.text ?? "")
                            Text(entry.timestamp ?? Date(), style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Journal")
        }
    }
}

