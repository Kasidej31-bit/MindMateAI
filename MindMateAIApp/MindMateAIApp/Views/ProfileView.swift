import SwiftUI

struct ProfileView: View {
    @AppStorage("username") private var username: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)

                    Text("Logged in as \(username)")

                    Button("Sign Out") {
                        KeychainHelper.deletePassword(for: username)
                        username = ""
                    }
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
    }
}

