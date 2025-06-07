//
//  Untitled.swift
//  LOTRConverter
//
//  Created by Stoyan Hristov on 5.06.25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
