//
//  ContentView.swift
//  SwiftUI-Apprentice-2023
//
//  Created by Roman Shestopal on 15.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var historyStore = HistoryStore()
    @State private var selectedTab = 9
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab, history: $historyStore)
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .tabItem { Label("Welcome", systemImage: "hand.wave") }
                    .tag(9)
                
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    ExerciseView(selectedTab: $selectedTab, history: $historyStore, index: index)
                        .tabItem { Label("Exercise", systemImage: "figure.flexibility") }
                        .tag(index)
                }
                
                HistoryView(showHistory: .constant(false), history: $historyStore)
                    .tabItem { Label("History", systemImage: "person.badge.clock") }
                SuccessView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Success", systemImage: "trophy")
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
