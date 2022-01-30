//
//  SoundManager.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 30.01.2022.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    var volume: Float = 1.0
    
    enum SoundEffect: String {
        case flip = "click"
        case nomatch = "nomatch"
        case explosion = "explosion"
    }
    
    private init() {}
    
    func playSound(_ effect: SoundEffect) {
        guard let bundlePath = Bundle.main.path(forResource: effect.rawValue, ofType: "mp3") else { return }
                        
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bundlePath))
            player?.volume = volume
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
