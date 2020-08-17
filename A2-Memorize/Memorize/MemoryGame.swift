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
    var themeIndex: Int?
    private var timer: Date
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, themeIndex: Int, cardContentFactory: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            for cardIndex in 0...1 {
                cards.append(Card(id: pairIndex * 2 + cardIndex, content: cardContentFactory(pairIndex)))
            }
        }
        
        cards.shuffle()
        score = 0
        self.themeIndex = themeIndex
        timer = Date()
    }
    
    // MARK: EC 2
    
    private mutating func getTimerPoints() -> Int {
        let val = 10 - min(10, Int(timer.timeIntervalSinceNow))
        timer = Date()
        return val
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2 + getTimerPoints()
                } else {
                    if cards[chosenIndex].hasBeenSeen { score -= 1 }
                    if cards[potentialMatchIndex].hasBeenSeen { score -= 1 }
                    cards[chosenIndex].hasBeenSeen = true
                    cards[potentialMatchIndex].hasBeenSeen = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false
        var content: CardContent
    }
}
