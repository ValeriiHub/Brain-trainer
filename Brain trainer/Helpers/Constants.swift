//
//  Constants.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 01.02.2022.
//

import Foundation



struct K {
    static let CardCVCellIdentifier = "CardCell"
    
    static let bombDeltaTimeText = "-20"
    static let cardImageNameTimer = "timer"
    
    
    static func convertTimeToText(from seconds: Int) -> String {
        let text = "\(String(format:"%02i:%02i", seconds / 60 % 60, seconds % 60))"
        return text
    }
}
