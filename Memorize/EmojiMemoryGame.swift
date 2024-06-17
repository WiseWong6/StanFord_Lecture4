//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // viewModel负责与View和Model通信，其将数据传入Model，并将结果返回View，先要有数据
    private static let emojis = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]

    // 这是一个ViewModel，需要调用model的方法，首先需要有一个model，是已定义的model类型
    // 用 Published 声明model，当变化时涉及的 View 会重新渲染
    @Published var model = createMemoryGame()

    // 用emojis数组初始化model里的Card的content
    // 定义一个 createMemoryGame 方法返回 Model类型，并完成初始化
    //range传入了emojis 数组的计数，cardFactory 传入 index 并返回一个 string
    //注意这里 index 表示传入闭包的值，而 in用于分隔传入参数和闭包主体，in 后面表示接受值后要运行的代码
    //为了让卡片对可修改,传入常量，但是卡片内容是通过 emoji 来初始化的，赋值给 index 必然会越界，增加越界保护
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCard: 8, cardFactory: {
            if emojis.indices.contains($0){
                return emojis[$0]
            } else{
                return "⁉️"
            }
        })
    }

    //声明一个 cards 变量，调用 model 的 cards 值返回给 viewModel
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    // 这是一个让model调用它的shuffle方法的方法
    func shuffle() {
        model.shuffle()
    }

    func toggle(at index: Int) {
//        model.cards[index].isFaceUp.toggle()
        model.toggle(at: index)
    }
}
