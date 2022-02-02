//
//  SettingsVC.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 02.02.2022.
//

protocol CloseButtonDelegate: AnyObject {
    func continueTimer()
}

import UIKit

class SettingsVC: UIViewController {
    
    //MARK: - Properties
    
    let settingsView = SettingsView()
    
    weak var delegate: CloseButtonDelegate?
    
    //MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAnimate()
        configureButtons()
    }
    
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
    
    @objc private func closeButtonPressed() {
        removeAnimate()
        delegate?.continueTimer()
    }
}
