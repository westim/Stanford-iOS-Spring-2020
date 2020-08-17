//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Timothy West on 8/13/20.
//  Copyright © 2020 Tim West. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static var theme = ["👻", "🎃", "🕷", "🐝", "🦇", "💀", "🧙‍♀️", "🕸", "🧟‍♀️", "🌑", "👁", "😵"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            theme[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
