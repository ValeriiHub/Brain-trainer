//
//  HighScoreVC.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class HighScoreVC: UIViewController {

    //MARK: - Properties
    
    let highScoreView = HighScoreView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = . green
        
        view.addSubview(highScoreView)
        highScoreView.frame = view.bounds
    }
}
