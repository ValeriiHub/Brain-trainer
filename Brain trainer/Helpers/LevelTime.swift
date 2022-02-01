//
//  LevelTime.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 31.01.2022.
//

import Foundation

enum Level {
    case easy
    case medium
    case hard
}

extension Level {
    var time: Int {
        switch self {
        case .easy:
            return 10
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

