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
    
    var body: some View {
        NavigationView {
            Grid(items: viewModel.cards) { card in
                CardView(card: card, colors: self.viewModel.themeColors).onTapGesture {
                    self.viewModel.choose(card: card)
                }.padding(5)
            }.navigationBarTitle(Text(viewModel.themeTitle))
             .navigationBarItems(leading: Text("Score: \(self.viewModel.score)"),
                                 trailing: Button("New Game") { self.viewModel.restart() })
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var colors: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }.aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).fill(colors.first!)
                Text(card.content)
            } else if !card.isMatched {
                if colors.count == 1 {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(colors.first!)
                } else {
                    // MARK: EC 1
                    RoundedRectangle(cornerRadius: cornerRadius).fill(fillGradient(with: colors))
                }
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    private func fillGradient(with colors: [Color]) -> LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
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
