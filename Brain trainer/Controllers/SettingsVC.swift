//
//  SettingsVC.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class SettingsVC: UIViewController {
    
    //MARK: - Properties
    
    let settingsView = SettingsView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(settingsView)
        settingsView.frame = view.bounds
        
        showAnimate()
        configureButtons()
    }
    
    //MARK: - Methods
    
    func configureButtons() {
        settingsView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
    func showAnimate() {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25) {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        } completion: { finished in
            if finished {
                self.view.removeFromSuperview()
            }
        }
    }
    
    @objc func closeButtonPressed() {
        removeAnimate()
    }
}
