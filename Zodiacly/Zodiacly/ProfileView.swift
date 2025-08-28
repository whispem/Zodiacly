//
//  ProfileView.swift
//  Zodiacly
//
//  Created by Emilie on 28/08/2025.
//
import SwiftUI

struct ProfileView: View {
    @State private var username: String = "Em'"
    @State private var bio: String = "Exploring the stars and chasing self-love 🌟"
    @State private var sun: String = "Cancer"
    @State private var moon: String = "Leo"
    @State private var rising: String = "Gemini"
    @State private var lilith: String = "Sagittarius"
    @State private var descendant: String = "Sagittarius"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Profile photo
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 140, height: 140)
                        .shadow(radius: 5)
                    
                    Text("Photo")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top, 40)
                
                // Username
                Text(username)
                    .font(.largeTitle)
                    .bold()
                
                // Bio
                Text(bio)
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Astrology info
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        Label(sun, systemImage: "sun.max.fill").foregroundColor(.orange)
                        Label(moon, systemImage: "moon.fill").foregroundColor(.blue)
                        Label(rising, systemImage: "star.fill").foregroundColor(.yellow)
                    }
                    HStack(spacing: 12) {
                        Text("⚡ Lilith: \(lilith)").font(.caption)
                        Text("✨ Descendant: \(descendant)").font(.caption)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(
            LinearGradient(colors: [.purple.opacity(0.9), .blue.opacity(0.8), .pink.opacity(0.7)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
        .navigationTitle("My Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}
