//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Akshay Ashok on 27/01/24.
//

import Foundation
import SwiftUI

extension Color{
    static let background1 = Color("Background")
    static let icon1 = Color("Icon")
    static let text1 = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date{
        guard let parseDate = DateFormatter.allNumericUSA.date(from: self) else {return Date()}
        return parseDate
    }
}
