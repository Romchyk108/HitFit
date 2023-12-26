//
//  HistoryView.swift
//  SwiftUI-Apprentice-2023
//
//  Created by Roman Shestopal on 15.06.2023.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @Binding var history: HistoryStore
    
    var today = Date()
    var yesterday = Date().addingTimeInterval(-86400)
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(
                            header: Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)
                        ) {
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        }
                    }
                }
            }
            
            Button {
                showHistory.toggle()
            } label: {
                if showHistory {
                    Image(systemName: "xmark.circle")
                }
            }
            .font(.title)
            .padding()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(false), history: .constant(HistoryStore()))
    }
}
