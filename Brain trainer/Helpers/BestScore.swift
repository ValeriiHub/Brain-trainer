//
//  BestScore.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 31.01.2022.
//

import Foundation

struct BestScore {
    static var easyLevel: Int {
        get {
            return UserDefaults.standard.integer(forKey: "easyLevel")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "easyLevel")
        }
    }
    
    static var mediumLevel: Int {
        get {
            return UserDefaults.standard.integer(forKey: "mediumLevel")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "mediumLevel")
        }
    }
    
    static var hardLevel: Int {
        get {
            return UserDefaults.standard.integer(forKey: "hardLevel")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "hardLevel")
        }
    }
}
