import SwiftUI

struct OnboardingView: View {
    @AppStorage("username") private var username: String = ""
    @State private var inputName = ""
    @State private var inputPassword = ""
    @State private var showError = false

    var body: some View {
        VStack(spacing: 20) {
            Text("MindMate AI Login")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Username", text: $inputName)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $inputPassword)
                .textFieldStyle(.roundedBorder)

            Button("Login / Sign Up") {
                if let savedPassword = KeychainHelper.getPassword(for: inputName) {
                    // Try logging in
                    if savedPassword == inputPassword {
                        username = inputName
                    } else {
                        showError = true
                    }
                } else {
                    // Save new user
                    KeychainHelper.savePassword(inputPassword, for: inputName)
                    username = inputName
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(inputName.isEmpty || inputPassword.isEmpty)

            if showError {
                Text("Incorrect password. Try again.")
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding()
    }
}
