//
//  ViewController.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: - Properties
    
    let mainView = MainView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainView)
        mainView.frame = view.bounds
    }
}

