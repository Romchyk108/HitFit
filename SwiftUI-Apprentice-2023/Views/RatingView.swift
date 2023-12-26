//
//  RatingView.swift
//  HIITFit
//
//  Created by Roman Shestopal on 19.09.2023.
//

import SwiftUI

struct RatingView: View {
    @AppStorage("ratings") private var ratings = ""
    @State private var rating = 0
    let maximumRating = 5
    let exerciseIndex: Int
    
    let onColor: Color = .red
    let offColor: Color = .gray
    
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(toLength: desiredLength, withPad: "0", startingAt: 0)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(index > rating ? offColor : onColor)
                    .font(.largeTitle)
                    .onTapGesture {
                        updateRating(index: index)
                    }
                    .onChange(of: ratings, perform: { _ in
                        let index = ratings.index(
                            ratings.startIndex,
                        offsetBy: exerciseIndex)
                        let character = ratings[index]
                        rating = character.wholeNumberValue ?? 0
                    })
            }
        }
        .previewLayout(/*@START_MENU_TOKEN@*/.sizeThatFits/*@END_MENU_TOKEN@*/)
    }
    
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
}

struct RatingView_Previews: PreviewProvider {
    @AppStorage("ratings") static var ratings: String?
    static var previews: some View {
        ratings = nil
        return RatingView(exerciseIndex: 0)
            .previewLayout(.sizeThatFits)
    }
}
