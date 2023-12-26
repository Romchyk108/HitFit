//
//  SuccessView.swift
//  SwiftUI-Apprentice-2023
//
//  Created by Roman Shestopal on 15.06.2023.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    var resetShowTimer: (() -> Void)?
    
    let placeholder = """
                Good job completing all four exercises!
                Remember tomorrow's another day.
                So eat well and get some rest.
                """
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()
            
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.purple)
                
                Text("High Five!")
                    .font(.largeTitle)
                    .bold()
                
                Group {
                    Text(placeholder)
                        .multilineTextAlignment(.center)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                Button {
                    dismiss()
                    selectedTab = 9
                } label: {
                    Text("Continue")
                }
                .font(.title2)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 2))
            }
            .padding()
        }
        .previewLayout(.sizeThatFits)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3), resetShowTimer: nil)
    }
}
