//
//  Sound.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 02.02.2022.
//

import Foundation

struct Sound {
    static var soundManager: Float {
        get {
            return UserDefaults.standard.float(forKey: "soundManagerVolume")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "soundManagerVolume")
        }
    }
    
    static var musicManager: Float {
        get {
            return UserDefaults.standard.float(forKey: "musicManagerVolume")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "musicManagerVolume")
        }
    }
}
