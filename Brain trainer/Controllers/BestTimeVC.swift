//
//  HighScoreVC.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class BestTimeVC: UIViewController {

    //MARK: - Properties
    
    let bestTimeView = BestTimeView()
    
    //MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = bestTimeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        configureButtons()
    }
    
    func configureButtons() {
        bestTimeView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true)
    }
}
