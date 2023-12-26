//
//  CheckMark.swift
//  HIITFit
//
//  Created by Roman Shestopal on 30.09.2023.
//

import SwiftUI

struct CheckMark: View {
    @Binding var isAnimating: Bool
    @Binding var time: Int
    let size: Double
    
    var body: some View {
        ZStack {
            Circle()
                .trim(to: isAnimating ? 1: 0)
                .stroke(.green, lineWidth: 3)
                .frame(width: size + 15, height: size + 15)
                .animation(.linear(duration: Double(time)), value: isAnimating)
                .rotationEffect(Angle(degrees: 270))
            
            Image(systemName: "checkmark")
                .font(.largeTitle)
                .foregroundColor(.green)
                .scaleEffect(isAnimating ? 1.5 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.2).delay(Double(time)), value: isAnimating)
        }
    }
}

struct CheckMark_Previews: PreviewProvider {
    static var previews: some View {
        CheckMark(isAnimating: .constant(true), time: .constant(5), size: 55)
    }
}
