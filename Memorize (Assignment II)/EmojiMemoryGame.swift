//
//  EmojiMemoryGame.swift
//  Memorize (Assignment II)
//
//  Created by Carmen Morado on 8/15/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static let emojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"],
            numberOfPairsOfCards: 8,
            color: "red"
        ),
        Theme(
            name: "Food",
            emojis: ["🍕", "🌭", "🍟", "🍔", "🥘", "🍝", "🍜", "🎂", "🍰", "🍦"],
            numberOfPairsOfCards: 5,
            color: "yellow"
        ),
        Theme(
            name: "Animals",
            emojis: ["🦄", "🦊", "🐥", "🦋", "🐬", "🐳", "🐞", "🐶", "🐱", "🐹", "🦉", "🐒"],
            numberOfPairsOfCards: 6,
            color: "orange"
        ),
        Theme(
            name: "Portraits",
            emojis: ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🌆", "🏙", "🌃", "🌌","🌉","🌁"],
            numberOfPairsOfCards: 6,
            color: "purple"
        ),
        Theme(
            name: "Plants",
            emojis: ["🐲", "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍃"],
            numberOfPairsOfCards: 4,
            color: "green"
        ),
        Theme(
            name: "Weather",
            emojis: ["🌤", "☀️", "🌦", "🌧", "❄️", "🌩", "⛈", "☁️"],
            numberOfPairsOfCards: 3,
            color: "blue"
        )
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards)  { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeName: String {
        theme.name
    }
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        case "green":
            return .green
        case "blue":
            return .blue
        default:
            return .orange
        }
    }
    
    var score: Int {
        model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}

