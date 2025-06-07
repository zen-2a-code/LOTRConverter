//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 31.05.25.
//
import SwiftUI

struct ExchangeRate: View {
    let leftExchangeImage: ImageResource
    let currencyExchangeText: String
    let rightExchangeImage: ImageResource
    
    var body: some View {
        HStack{
            
            // left currency image
            Image(leftExchangeImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //exchange rate text
            Text(currencyExchangeText)
            
            // right currency image
            Image(rightExchangeImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftExchangeImage: .silverpiece, currencyExchangeText: "1 Silver Piece = 4 Silver Pennis", rightExchangeImage: .silverpenny)
}

