//
//  MemoryGame.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import Foundation

struct MemoryGame<cardText> {
    // 这是一个model，model处理数据和方法
    
    var cards = [Card]()
    
    struct Card {
        var isFaceUp = true
        let content: cardText
    }
    
    //初始化cardText
    init(range:Int,cardFactory:(Int) -> cardText) {
        for index in 0..<range{
            let content:cardText = cardFactory(index)
            cards.append(Card(content: content))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func toggle(){
        for index in cards.indices{
            cards[index].isFaceUp.toggle()
        }
        
    }
}
