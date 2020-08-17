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
    
    private static var themes = [
        Theme(name: "Halloween", emoji: ["👻", "🎃", "🕷", "🐝", "🦇", "💀", "🧙‍♀️", "🕸", "🧟‍♀️", "🌑", "👁", "😵"], colors: [.orange, .black], numberOfPairsOfCards: 4),
        Theme(name: "Flags", emoji: ["🏳️", "🏴", "🏁", "🚩", "🏳️‍🌈", "🇦🇫", "🇺🇳", "🇦🇺", "🇯🇲", "🇺🇸", "🇹🇰", "🇰🇷"], colors: [.blue]),
        Theme(name: "Animals", emoji: ["🐶", "🐱", "🐹", "🐰", "🐻", "🐤", "🐸", "🐵", "🐮", "🐷", "🐼", "🐯"], colors: [.green, .blue]),
        Theme(name: "Fruit", emoji: ["🍏", "🍎", "🍐", "🍊", "🥝", "🥥", "🍍", "🍌", "🍉", "🍇", "🍓", "🍒"], colors: [.red]),
        Theme(name: "Sports", emoji: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒"], colors: [.pink]),
        Theme(name: "Electronics", emoji: ["⌚️", "📱", "💻", "⌨️", "🖨", "🕹", "💾", "💿", "📷", "📹", "📺", "🔦"], colors: [.gray])
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        let randomThemeIndex = Int.random(in: 0..<themes.count)
        
        return MemoryGame<String>(numberOfPairsOfCards: themes[randomThemeIndex].numberOfPairsOfCards, themeIndex: randomThemeIndex) { pairIndex in
            themes[randomThemeIndex].emoji[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var themeTitle: String {
        if let index = model.themeIndex {
            return Self.themes[index].name
        } else {
            return "Memory"
        }
    }
    
    var themeColors: [Color] {
        if let index = model.themeIndex {
            return Self.themes[index].colors
        } else {
            return [.gray]
        }
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func restart() {
        model = Self.createMemoryGame()
    }
}
