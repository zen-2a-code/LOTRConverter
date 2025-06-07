//
//  Currency.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 2.06.25.
//

// this currencies are based on the most expencive currency - the gold piece, all others are created of how much of them is to reach one goldPiece

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable{
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    case stoyanCoin = 0.1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        case .stoyanCoin:
                .stoyanCoin
        }
    }
    
     var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        case .stoyanCoin:
            "Stoyan's Coin"
        }
    }
    
    func convert(_ amountString: String, to toCurrency : Currency) -> String {
        
        guard let doubleAmount = NumberParser.parseStringToDecimal(from: amountString) else {
            return ""
        }
    
        let convertedAmount = (doubleAmount / self.rawValue) * toCurrency.rawValue
        
        if convertedAmount.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(convertedAmount))
        }
        
        return String(format: "%.2f", convertedAmount)
    }
}
