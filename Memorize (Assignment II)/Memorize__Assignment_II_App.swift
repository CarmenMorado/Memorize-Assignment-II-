//
//  Memorize__Assignment_II_App.swift
//  Memorize (Assignment II)
//
//  Created by Carmen Morado on 8/15/21.
//

import SwiftUI

@main
struct Memorize__Assignment_II_App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
