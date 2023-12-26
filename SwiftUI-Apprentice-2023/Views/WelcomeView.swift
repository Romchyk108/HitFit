//
//  WelcomeView.swift
//  SwiftUI-Apprentice-2023
//
//  Created by Roman Shestopal on 15.06.2023.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @Binding var history: HistoryStore
    @State private var showHistory: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory, content: {
                    HistoryView(showHistory: $showHistory, history: $history)
                })
                .padding()
            }
            
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("With high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizedToFill(width: 200, height: 200)
                        .clipShape(Circle())
                }
                
                Button {
                    selectedTab = 0
                } label: {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                }
                .font(.title2)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2))
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9), history: .constant(HistoryStore()))
    }
}
