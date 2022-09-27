//
//  EmojiMemoryGame.swift
//  Memorize (iOS)
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2022.
//

import SwiftUI

func makeContent(index: Int) -> String{
    return "🤙🏻";
}



class EmojiMemoryGame {

    // variables in a class init randomly
    static var emojis: Array<String> = ["😈", "👁", "💪🏾","💄", "👱🏽‍♀️", "🫁", "🧠"]
    
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairCard: 4) { pairIndex in emojis[pairIndex] };
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards;
    }
}
