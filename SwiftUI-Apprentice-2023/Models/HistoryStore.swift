//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Roman Shestopal on 21.09.2023.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises = [String]()
}

struct HistoryStore {
    init(){
        #if DEBUG
            createDevDate()
        #endif
    }

    var exerciseDays = [ExerciseDay]()
    
    mutating func addDoneExercise(exerciseName: String) {
        let today = Date()
        if let date = exerciseDays.first?.date, today.isSameDate(as: date) {
            print("Added \(exerciseName)!")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
    }
}

