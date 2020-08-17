//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Timothy West on 8/12/20.
//  Copyright © 2020 Tim West. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private var fontSize: Font {
        viewModel.cards.count >= 10 ? .body : .largeTitle
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }.padding()
        .foregroundColor(.orange)
        .font(self.fontSize)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }.aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    // MARK: Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let aspectRatio: CGFloat = 2 / 3
}

// MARK: Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
