//
//  ConvertionSection.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 7.06.25.
//

import SwiftUI
import TipKit

struct ConvertionSection: View {
    @Binding var selectedCurrency: Currency
    @Binding var currencyAmount: String
    @Binding var showSelectCurrencySheet: Bool
    @FocusState.Binding var amountIsFocsed: Bool
    var shouldAlignRightForTextField: Bool = false
    var currencyTip = CurrencyTip()

    var body: some View {
        VStack {
            // currency
            HStack {
                if shouldAlignRightForTextField {
                    // currency text
                    Text(selectedCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)

                    // currency image
                    Image(selectedCurrency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)

                } else {
                    // currency image
                    Image(selectedCurrency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)

                    // currency text
                    Text(selectedCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrencySheet.toggle()
                currencyTip.invalidate(reason: .actionPerformed)
            }
            .popoverTip(
                shouldAlignRightForTextField ? nil : currencyTip,
                arrowEdge: .bottom
            )

            // text field
            TextField("Amount", text: $currencyAmount)
                .textFieldStyle(.roundedBorder)
                .focused($amountIsFocsed)
                .multilineTextAlignment(
                    shouldAlignRightForTextField ? .trailing : .leading
                )
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var selectedCurrency: Currency = .stoyanCoin
        @State var currencyAmount = ""
        @State var showSelectCurrencySheet = false
        @FocusState var amountIsFocused: Bool

        var body: some View {
            ConvertionSection(
                selectedCurrency: $selectedCurrency,
                currencyAmount: $currencyAmount,
                showSelectCurrencySheet: $showSelectCurrencySheet,
                amountIsFocsed: $amountIsFocused,
                shouldAlignRightForTextField: true
            )
        }
    }

    return PreviewWrapper()
}
