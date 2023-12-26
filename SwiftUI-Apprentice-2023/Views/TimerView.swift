//
//  TimerView.swift
//  HIITFit
//
//  Created by Roman Shestopal on 29.09.2023.
//

import SwiftUI

struct CountdownView: View {
    @Binding var timeRemaining: Int
    @Binding var start: Bool
    
    let date: Date
    let size: Double
    
    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date) { _ in
                if start {
                    timeRemaining -= 1
                }
            }
    }
}

struct TimerView: View {
    @Binding var timeRemaining: Int
    @Binding var timerDone: Bool
    @Binding var start: Bool
    let size: Double
    
    var timeView: some View {
        TimelineView(.animation(minimumInterval: 1.0, paused: timeRemaining <= 0)) { context in
            if !timerDone {
                CountdownView(timeRemaining: $timeRemaining, start: $start, date: context.date, size: size)
            }
        }
        .onChange(of: timeRemaining) { _ in
            if timeRemaining < 1 {
                timerDone = true
            }
        }
        .onAppear(){
            if timeRemaining == 0 && timerDone {
//                timeRemaining = 3
//                timerDone = false
            }
        }
    }
    
    var body: some View {
            ZStack(alignment: .center) {
                timeView
                CheckMark(isAnimating: $start, time: $timeRemaining, size: size)
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeRemaining: .constant(10), timerDone: .constant(false), start: .constant(true), size: 50)
    }
}
