import SwiftUI

struct EncouragementView: View {
    @AppStorage("lastMood") var lastMood: String = ""
    @State private var message = ""
    @State private var rating: Int? = nil
    @State private var feedbackText = ""
    @State private var feedbackSubmitted = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Daily Encouragement")
                        .font(.title)
                        .fontWeight(.semibold)

                    Text(message.isEmpty ? "Tap the button to get a boost!" : message)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .transition(.opacity.combined(with: .scale))
                        .animation(.easeInOut, value: message)

                    Button("Get Encouragement") {
                        let moodBasedMessages: [String]

                        switch lastMood {
                        case "Happy":
                            moodBasedMessages = ["Keep that smile shining! 🌞", "Happiness is contagious — share it!"]
                        case "Sad":
                            moodBasedMessages = ["It's okay to feel this way. Be gentle with yourself.", "Your feelings are valid."]
                        case "Anxious":
                            moodBasedMessages = ["Take a deep breath. You are safe.", "You’re doing better than you think."]
                        case "Angry":
                            moodBasedMessages = ["Let it out safely. Peace will follow.", "Breathe out the tension."]
                        case "Tired":
                            moodBasedMessages = ["Rest isn’t lazy — it’s healing.", "Your body deserves care."]
                        case "Excited":
                            moodBasedMessages = ["Chase that spark! You’re unstoppable!", "Your energy is magnetic!"]
                        default:
                            moodBasedMessages = ["You are enough. Keep going 💙"]
                        }

                        message = moodBasedMessages.randomElement() ?? "You're doing great!"
                        feedbackSubmitted = false
                        rating = nil
                        feedbackText = ""
                    }
                    .buttonStyle(.borderedProminent)

                    // Feedback Section
                    if !message.isEmpty && !feedbackSubmitted {
                        VStack(spacing: 10) {
                            Text("Was this helpful?")
                                .font(.subheadline)

                            HStack {
                                ForEach(1...5, id: \.self) { star in
                                    Image(systemName: star <= (rating ?? 0) ? "star.fill" : "star")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(.yellow)
                                        .onTapGesture {
                                            rating = star
                                        }
                                }
                            }

                            TextField("Any suggestions?", text: $feedbackText)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal)

                            Button("Submit Feedback") {
                                saveFeedback(rating: rating ?? 0, comment: feedbackText, message: message)
                                feedbackSubmitted = true
                            }
                            .disabled(rating == nil)
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    }

                    if feedbackSubmitted {
                        Text("✅ Thank you for your feedback!")
                            .foregroundColor(.green)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Encouragement")
        }
    }

    // MARK: - Feedback Save Function
    func saveFeedback(rating: Int, comment: String, message: String) {
        let log = "📝 Feedback — Rating: \(rating), Message: \"\(message)\", Comment: \"\(comment)\"\n"
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("feedback_log.txt")

        if FileManager.default.fileExists(atPath: fileURL.path) {
            if let handle = try? FileHandle(forWritingTo: fileURL) {
                handle.seekToEndOfFile()
                if let data = log.data(using: .utf8) {
                    handle.write(data)
                    handle.closeFile()
                }
            }
        } else {
            try? log.write(to: fileURL, atomically: true, encoding: .utf8)
        }

        print("✅ Feedback saved to \(fileURL)")
    }
}

