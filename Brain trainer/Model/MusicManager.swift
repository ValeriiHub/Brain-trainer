//
//  MusicManager.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 02.02.2022.
//

import Foundation
import AVFoundation

class MusicManager {
    
    static var shared = MusicManager()
    
    var player: AVAudioPlayer?
    
    var volume: Float = 1.0
    
    private init() {}
    
    func playSound() {
        guard let bundlePath = Bundle.main.path(forResource: "musicTrack", ofType: "mp3") else { return }
                        
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bundlePath))
            player?.volume = volume
            player?.numberOfLoops = -1
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
