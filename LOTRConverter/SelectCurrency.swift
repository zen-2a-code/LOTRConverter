//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 01.06.25.
//
import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTopCurrency: Currency
    @Binding var selectedBottomCurrency: Currency

    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .background(Color.brown)
                .ignoresSafeArea()

            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                // Currency icons
                IconGrid(selectedCurrency: $selectedTopCurrency)

                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)

                // Currency icons to modify
                IconGrid(selectedCurrency: $selectedBottomCurrency)

                // Done
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)

            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    
    
    SelectCurrency(selectedTopCurrency: $topCurrency, selectedBottomCurrency: $bottomCurrency)
}
