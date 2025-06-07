//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 29.05.25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfoSheet = false
    @State var showSelectCurrencySheet = false

    @State var leftCurrencyAmount = ""
    @State var rightCurrencyAmount = ""

    @FocusState var leftAmountTypingIsFocused: Bool
    @FocusState var rightAmountTypingIsFocused: Bool

    @State var selectedLeftCurrency: Currency = {
        let rawValue: Double = UserDefaults.standard.double(
            forKey: "selectedLeftCurrency"
        )
        return Currency(rawValue: rawValue) ?? .silverPiece
    }()

    @State var selectedRightCurrency: Currency = {
        let rawValue: Double = UserDefaults.standard.double(
            forKey: "selectedRightCurrency"
        )
        return Currency(rawValue: rawValue) ?? .goldPiece
    }()

    let currencyTip = CurrencyTip()

    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                // Prancing pony image logo
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                // currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                // Conversion section
                HStack {
                    // left convertion section
                    ConvertionSection(selectedCurrency: $selectedLeftCurrency, currencyAmount: $leftCurrencyAmount, showSelectCurrencySheet: $showSelectCurrencySheet, amountIsFocsed: $leftAmountTypingIsFocused)

                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    // right conversion section
                    ConvertionSection(selectedCurrency: $selectedRightCurrency, currencyAmount: $rightCurrencyAmount, showSelectCurrencySheet: $showSelectCurrencySheet, amountIsFocsed: $rightAmountTypingIsFocused, shouldAlignRightForTextField: true)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(Capsule())
                .keyboardType(.decimalPad)

                Spacer()

                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfoSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)

                    }
                    .padding(.trailing)
                }
            }
            //            .border(Color.blue)

        }
        .onTapGesture {
            rightAmountTypingIsFocused = false
            leftAmountTypingIsFocused = false
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftCurrencyAmount) {
            if leftAmountTypingIsFocused {
                rightCurrencyAmount = selectedLeftCurrency.convert(
                    leftCurrencyAmount,
                    to: selectedRightCurrency
                )
            }
        }
        .onChange(of: rightCurrencyAmount) {
            if rightAmountTypingIsFocused {
                leftCurrencyAmount = selectedRightCurrency.convert(
                    rightCurrencyAmount,
                    to: selectedLeftCurrency
                )
            }
        }
        .onChange(of: selectedLeftCurrency) {
            leftCurrencyAmount = selectedRightCurrency.convert(
                rightCurrencyAmount,
                to: selectedLeftCurrency
            )

            UserDefaults.standard.set(
                selectedLeftCurrency.rawValue,
                forKey: "selectedLeftCurrency"
            )
        }
        .onChange(of: selectedRightCurrency) {
            rightCurrencyAmount = selectedLeftCurrency.convert(
                leftCurrencyAmount,
                to: selectedRightCurrency
            )

            UserDefaults.standard.set(
                selectedRightCurrency.rawValue,
                forKey: "selectedRightCurrency"
            )
        }
        .sheet(isPresented: $showExchangeInfoSheet) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrencySheet) {
            SelectCurrency(
                selectedTopCurrency: $selectedLeftCurrency,
                selectedBottomCurrency: $selectedRightCurrency
            )
        }
    }
}

#Preview {
    ContentView()
}
