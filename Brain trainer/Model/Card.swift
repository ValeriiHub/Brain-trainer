//
//  Card.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 25.01.2022.
//

import Foundation

class Card {
    var imageName = ""
    var isFlipped = false
    var isMatched = false
}

extension Card {
    static func getCarts(pairs: Int, timer: Int) -> [Card] {
        
        var generatedCardsArrey:[Card] = []
        
        for index in 1...pairs {
            let card = Card()
            card.imageName = "Card\(index)"

            let anotherCard = Card()
            anotherCard.imageName = "Card\(index)"
            
            generatedCardsArrey += [card, anotherCard]
        }
        
        for _ in 0..<timer {
            let card = Card()
            card.imageName = "timer"
            
            generatedCardsArrey.append(card)
        }
        
        return generatedCardsArrey.shuffled()
    }
}
