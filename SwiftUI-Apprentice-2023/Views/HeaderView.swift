//
//  HeaderView.swift
//  HIITFit
//
//  Created by Roman Shestopal on 19.09.2023.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    var titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                Image(systemName: selectedTab == 9 ? "hand.wave.fill" : "hand.wave")
                    .font(selectedTab == 9 ? .largeTitle : .title)
                    .onTapGesture {
                        selectedTab = 9
                    }
                NumbersView(selectedTab: $selectedTab)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}

struct NumbersView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            ForEach(Exercise.exercises.indices, id: \.self) {item in
                if item == selectedTab {
                    Image(systemName: "\(item + 1).circle.fill")
                        .font(.largeTitle)
                } else {
                    Image(systemName: "\(item + 1).circle")
                        .onTapGesture {
                            selectedTab = item
                        }
                }
            }
        }
        .font(.title2)
        .previewLayout(.sizeThatFits)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HeaderView(selectedTab: .constant(0), titleText: Exercise.exercises[0].exerciseName)
            HeaderView(selectedTab: .constant(2), titleText: Exercise.exercises[2].exerciseName)
            HeaderView(selectedTab: .constant(9), titleText: "Welcome")
            NumbersView(selectedTab: .constant(5))
            NumbersView(selectedTab: .constant(0))
            NumbersView(selectedTab: .constant(1))
            NumbersView(selectedTab: .constant(2))
            NumbersView(selectedTab: .constant(3))
        }
    }
}
