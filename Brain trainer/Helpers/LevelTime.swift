//
//  LevelTime.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 31.01.2022.
//

import Foundation

enum Level: String {
    case easy = "EASY LEVEL"
    case medium = "MEDIUM LEVEL"
    case hard = "HARD LEVEL"
}

extension Level {
    var time: Int {
        switch self {
        case .easy:
            return 60
        case .medium:
            return 90
        case .hard:
            return 180
        }
    }
    
    var cardsCount: Double {
        switch self {
        case .easy:
            return 4
        case .medium:
            return 5
        case .hard:
            return 6
        }
    }
}

