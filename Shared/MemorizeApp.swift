//
//  MemorizeApp.swift
//  Shared
//
//  Created by Vu Nguyen Ngoc Anh on 22/09/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
