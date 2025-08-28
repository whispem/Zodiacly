//
//  HomeView.swift
//  Zodiacly
//
//  Created by Emilie on 28/08/2025.
//
import SwiftUI

struct HomeView: View {
    @State private var profiles = [
        Profile(
            name: "Perfect Lover",
            description: "Deep, emotional and perfectly aligned.",
            sun: "Sagittarius", moon: "Leo", rising: "Cancer",
            lilith: "Libra", descendant: "Capricorn"
        )
    ]
    
    @State private var topProfileIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [.purple, .blue, .pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // Swipeable card
                if let profile = profiles.first {
                    CardView(profile: profile)
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if abs(value.translation.width) > 100 {
                                        // No other profiles, reset index
                                        topProfileIndex = 0
                                    }
                                }
                        )
                        .animation(.spring(), value: topProfileIndex)
                }
            }
            .navigationTitle("Zodiacly")
        }
    }
}

struct CardView: View {
    let profile: Profile
    
    var body: some View {
        VStack(spacing: 12) {
            // Image placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(height: 200)
                    .shadow(radius: 5)
                
                Text("Profile pic")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
            }
            
            // Infos et astrologie
            VStack(alignment: .leading, spacing: 8) {
                Text(profile.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                
                Text(profile.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 8) {
                    Text("🌞 \(profile.sun)")
                    Text("🌙 \(profile.moon)")
                    Text("🪐 \(profile.rising)")
                }
                .font(.caption)
                .foregroundColor(.black)
                
                HStack(spacing: 8) {
                    Text("⚡ Lilith: \(profile.lilith)")
                    Text("✨ Descendant: \(profile.descendant)")
                }
                .font(.caption)
                .foregroundColor(.black)
            }
            .padding()
        }
        .frame(width: 320, height: 380)
        .background(Color.white) // SOLID card background
        .cornerRadius(20)
        .shadow(radius: 8)
        .padding()
    }
}

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let sun: String
    let moon: String
    let rising: String
    let lilith: String
    let descendant: String
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
