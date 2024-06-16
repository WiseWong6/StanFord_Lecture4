//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
