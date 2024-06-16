//
//  MemoryGame.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import Foundation

struct MemoryGame<cardText> {
    // 这是一个model，model处理数据和方法
    
    //初始化一个cards变相是Card类型的数组，外部可读不可修改
    private(set) var cards = [Card]()
    
    //定义 Card 实例，其中 content 是 cardText 类型，这个类型是dontcare
    struct Card {
        var isFaceUp = true
        let content: cardText
    }
    
    // 适用init方法初始化cardText，参数是range和cardFactory
    //cardFactory 接受一个 Int值并且返回一个cardText类型
    init(range: Int, cardFactory: (Int) -> cardText) {
        //通过 for 循环，通过 cardFactory 传参 Int初始化 cardText 并赋值给 content
        //Card实例添加 content的内容 为 content
        //将添加了 content 的Card 实例添加到 cards 数组中
        
        for index in 0 ..< range {
            let content: cardText = cardFactory(index)
            cards.append(Card(content: content))
        }
    }
    
    //修改 cards 数组，并返回打乱后的数组
    //重置所有卡片的isFaceUp 的状态等于 true
    mutating func shuffle() {
        cards.shuffle()
        for index in cards.indices{
            cards[index].isFaceUp = true
        }
    }
    
    //根据数组索引将对应 cards 的 isFaceUp 切换
    mutating func toggle(at index: Int) {
            cards[index].isFaceUp.toggle()
    }
}
