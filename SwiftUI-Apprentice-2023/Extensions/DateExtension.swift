//
//  DateExtension.swift
//  HIITFit
//
//  Created by Roman Shestopal on 20.09.2023.
//

import Foundation

extension Date {
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func isSameDate(as date: Date) -> Bool {
        date.formatted(as: "MMM d") == self.formatted(as: "MMM d")
    }
}
