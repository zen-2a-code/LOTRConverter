//
//  NumberParser.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 7.06.25.
//

import Foundation


struct NumberParser {
    static func parseStringToDecimal(from input: String) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        
        if let number = formatter.number(from: input) {
            return number.doubleValue
        }
        
        let fallbackInput = input.replacingOccurrences(of: ",", with: ".")
        return Double(fallbackInput)
    }
}
