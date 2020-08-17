//
//  Theme.swift
//  Memorize
//
//  Created by Timothy West on 8/16/20.
//  Copyright © 2020 Tim West. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emoji: [String]
    var colors: [Color]
    var numberOfPairsOfCards: Int
    
    init(name: String, emoji: [String], colors: [Color], numberOfPairsOfCards: Int? = nil) {
        self.name = name
        self.emoji = emoji.shuffled()
        self.colors = colors
        self.numberOfPairsOfCards = numberOfPairsOfCards ?? Int.random(in: 2...emoji.count)
    }
}
