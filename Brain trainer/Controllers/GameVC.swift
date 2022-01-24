//
//  GameVC.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class GameVC: UIViewController {
    
    //MARK: - Properties
    
    let gameView = GameView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = . green
        
        view.addSubview(gameView)
        gameView.frame = view.bounds
    }
}
