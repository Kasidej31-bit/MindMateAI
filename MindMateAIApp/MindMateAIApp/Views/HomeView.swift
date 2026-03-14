//
//  HomeView.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 20/04/2025.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to MindMate AI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Your companion for mental wellness")
                    .font(.title3)
                    .foregroundColor(.gray)
                @AppStorage("username") var username: String = ""

                Text("Welcome back, \(username)")
                    .font(.title2)
                    .fontWeight(.medium)

            }
            .padding()
            .navigationTitle("Home")
        }
    }
}
