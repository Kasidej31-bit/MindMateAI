import SwiftUI
import CoreData

struct Mood: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let emoji: String
    let message: String
}

struct MoodSelectionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("lastMood") var lastMood: String = ""
    @State private var selectedMood: Mood? = nil
    @State private var animateSelection = false

    let moods: [Mood] = [
        Mood(name: "Happy", emoji: "😊", message: "Great to see you're feeling happy!"),
        Mood(name: "Sad", emoji: "😢", message: "It’s okay to feel sad. Take it easy."),
        Mood(name: "Anxious", emoji: "😰", message: "Breathe. You're doing your best."),
        Mood(name: "Angry", emoji: "😠", message: "Try to find calm. You deserve peace."),
        Mood(name: "Tired", emoji: "😴", message: "Rest is important. You deserve it."),
        Mood(name: "Excited", emoji: "🤩", message: "Let that positive energy flow!")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(.systemTeal), Color(.systemMint)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 16) {
                    Text("How are you feeling today?")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                  


                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 16) {
                        ForEach(moods) { mood in
                            Button(action: {
                                let impact = UIImpactFeedbackGenerator(style: .light)
                                impact.impactOccurred()
                                
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    selectedMood = mood
                                    animateSelection = true
                                }

                                lastMood = mood.name

                                let newMood = MoodEntry(context: viewContext)
                                newMood.moodName = mood.name
                                newMood.emoji = mood.emoji
                                newMood.message = mood.message
                                newMood.timestamp = Date()

                                do {
                                    try viewContext.save()
                                } catch {
                                    print("❌ Error saving mood: \(error.localizedDescription)")
                                }

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    animateSelection = false
                                }
                            }) {
                                VStack {
                                    Text(mood.emoji)
                                        .font(.system(size: 40))
                                    Text(mood.name)
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(16)
                                .shadow(radius: 4)
                                .scaleEffect(animateSelection && selectedMood?.id == mood.id ? 1.1 : 1.0)
                                .animation(.spring(), value: animateSelection)
                                .transition(.scale.combined(with: .opacity))
                            }
                        }
                    }

                    if let mood = selectedMood {
                        Text(mood.message)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .padding(.top)
                            .transition(.opacity.combined(with: .scale))
                            .animation(.easeInOut, value: selectedMood)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Mood Check-in")
        }
    }
}

