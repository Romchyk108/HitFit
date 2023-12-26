//
//  ExerciseView.swift
//  SwiftUI-Apprentice-2023
//
//  Created by Roman Shestopal on 15.06.2023.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @Binding var history: HistoryStore
    
    @State private var showSuccess: Bool = false
    @State private var showDone: Bool = false
    @State private var showTimer: Bool = false
    @State private var time: Int = 10
    
    var ratings = ["burpee" : 4, "step-up": 2, "sun-salute": 3]
    var index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button {
            showTimer.toggle()
        } label: {
            Text("Start Exercise")
        }
        .disabled(showTimer)
    }
    var doneButton: some View {
        Button {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
            history.addDoneExercise(exerciseName: exercise.exerciseName)
        } label: {
            Text("Done")
            Image(systemName: "hands.sparkles.fill")
        }
        .sheet(isPresented: $showSuccess) {
            SuccessView(selectedTab: $selectedTab, resetShowTimer: resetShowTimer)
                .presentationDetents([.medium, .large])
        }
        .disabled(!showDone)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center) {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)
                
                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mov") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mov")
                        .foregroundColor(.red)
                        .frame(width: geometry.size.width)
                }
                
                TimerView(timeRemaining: $time, timerDone: $showDone, start: $showTimer, size: geometry.size.height * 0.07)
                    .frame(height: geometry.size.height * 0.1)
                
                Button {
                    
                } label: {
                    HStack {
                        startButton
                        Spacer()
                        doneButton
                    }
                }
                .font(.title3)
                .padding()
                
                Spacer()
                
                RatingView(exerciseIndex: index)
                    .padding()
                
                Spacer()
                
                Button("History") { }
                    .padding(.bottom)
            }
        }
    }
    
    private func resetShowTimer() {
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), history: .constant(HistoryStore()), index: 3)
    }
}
