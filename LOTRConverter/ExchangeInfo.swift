//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 31.05.25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        ZStack{
          // BACKGROUND PARCHMENT IMAGE
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                // Title text
                Text("Exchange rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // Description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                    
                
                // Exchange rates
                ExchangeRate(leftExchangeImage: .stoyanCoin, currencyExchangeText: "1 Stoyan's coin = 10 Gold Pieces", rightExchangeImage: .goldpiece)
                
                ExchangeRate(leftExchangeImage: .goldpiece, currencyExchangeText: "1 Gold Piece = 4 Gold Pennies", rightExchangeImage: .goldpenny)
                
                ExchangeRate(leftExchangeImage: .goldpenny, currencyExchangeText: "1 Gold Penny = 4 Silver Pieces", rightExchangeImage: .silverpiece)
                
                ExchangeRate(leftExchangeImage: .silverpiece, currencyExchangeText: "1 Silver Piece = 4 Silver Pennies", rightExchangeImage: .silverpenny)
                
                ExchangeRate(leftExchangeImage: .silverpenny, currencyExchangeText: "1 Silver Penny = 100 Cooper Pennies", rightExchangeImage: .copperpenny)
                
                
                //Done button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
