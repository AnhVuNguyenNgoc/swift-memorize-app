//
//  MemoryGame.swift
//  Memorize (iOS)
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairCard: Int, createContent: (Int) -> CardContent){
        cards = Array<Card>();
        

        
        for pairIndex  in 0..<numberOfPairCard {
            let content: CardContent = createContent(pairIndex);
            cards.append(Card(content: content));
        }
    }
    
    func choose (){
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        
        var content: CardContent
        
    }
}
