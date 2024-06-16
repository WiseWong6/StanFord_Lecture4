//
//  ContentView.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing:0)],spacing:0) {
                ForEach(0 ..< emojis.count, id: \.self) { index in
                    CardView(cardContent: emojis[index]).aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                }
            }
        }

        .padding()
    }
}

struct CardView: View {
    var cardContent: String
    @State var isFaceUp = true

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.stroke(lineWidth: 2.0)
                base.fill(.white)
                Text(cardContent)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(isFaceUp ? 1:0)
            base.opacity(isFaceUp ? 0:1)
        }
        .foregroundColor(.blue)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
