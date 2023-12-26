//
//  ImageExtensions.swift
//  HIITFit
//
//  Created by Roman Shestopal on 21.09.2023.
//

import Foundation
import SwiftUI

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        return self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}
