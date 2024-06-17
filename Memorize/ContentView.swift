//
//  ContentView.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        ScrollView {
            Text("后续通过这个分支写课程的代码")
            cards
        }
        Button(action: {
            viewModel.shuffle()
        }, label: {
            Image(systemName: "arrow.clockwise.circle.fill")
            Text("Shuffle")
        })
        .buttonStyle(BorderedProminentButtonStyle())
        .buttonBorderShape(.capsule)
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(0 ..< viewModel.cards.count, id: \.self) { index in
                CardView(viewModel: viewModel, card: viewModel.cards[index], index: index)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
            }
        }
    }
}

struct CardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var card: MemoryGame<String>.Card
    var index: Int

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.stroke(lineWidth: 2.0)
                base.fill(.white)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1:0)
            base.opacity(card.isFaceUp ? 0:1)
        }
        .foregroundColor(.blue)
        .onTapGesture {
            viewModel.toggle(at: index)
        }
    }
}

#Preview {
    ContentView(viewModel: EmojiMemoryGame())
}
