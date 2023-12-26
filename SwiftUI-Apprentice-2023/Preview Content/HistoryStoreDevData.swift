//
//  HistoryStoreDevData.swift
//  HIITFit
//
//  Created by Roman Shestopal on 21.09.2023.
//

import Foundation

extension HistoryStore {
    mutating func createDevDate() {
        exerciseDays = [
            ExerciseDay(date: Date().addingTimeInterval(-86400),
                        exercises: [
                            Exercise.exercises[0].exerciseName,
                            Exercise.exercises[1].exerciseName,
                            Exercise.exercises[2].exerciseName
                        ]),
            ExerciseDay(date: Date().addingTimeInterval(-86400 * 2),
                        exercises: [Exercise.exercises[1].exerciseName,
                                   Exercise.exercises[3].exerciseName,
                                   Exercise.exercises[0].exerciseName
                                  ])
        ]
    }
}
