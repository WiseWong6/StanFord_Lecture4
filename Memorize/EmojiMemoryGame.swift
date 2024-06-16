//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import Foundation
import SwiftUI

class EmojiMemoryGame:ObservableObject {
    // viewModel负责与View和Model通信，其将数据传入Model，并将结果返回View，先要有数据
    private static let emojis = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]

    // 这是一个ViewModel，需要调用model的方法，首先需要有一个model，是已定义的model类型
    @Published var model = createMemoryGame()
    
    //用emojis数组初始化model里的Card的content
    static func createMemoryGame()->MemoryGame<String>{
        return MemoryGame(range: emojis.count) { index in
            return emojis[index]
        }
    }
    
    //和上一个方法衔接，上一个方法不仅是初始化了卡片内容，还将内容放入了cards数组
    var cards:[MemoryGame<String>.Card]{
        return model.cards
    }
    
    //这是一个让model调用它的shuffle方法的方法
    func shuffle(){
        model.shuffle()
    }
    
    func toggle(){
        model.toggle()
    }
}
