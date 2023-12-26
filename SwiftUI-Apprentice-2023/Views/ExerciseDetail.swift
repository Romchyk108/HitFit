//
//  ExerciseDetail.swift
//  SwiftUI-Apprentice-2023
//
//  Created by Roman Shestopal on 15.06.2023.
//

import SwiftUI

struct ExerciseDetail: View {
    @State var text: String
    var body: some View {
        Text(text)
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetail(text: "some text")
    }
}
