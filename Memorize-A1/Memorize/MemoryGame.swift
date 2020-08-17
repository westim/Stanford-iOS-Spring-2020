//
//  MemoryGame.swift
//  Memorize
//
//  Created by Timothy West on 8/13/20.
//  Copyright © 2020 Tim West. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card] = []
    var score: Int
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            for cardIndex in 0...1 {
                cards.append(Card(id: pairIndex * 2 + cardIndex, content: cardContentFactory(pairIndex)))
            }
        }
        
        cards.shuffle()
        score = 0
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
