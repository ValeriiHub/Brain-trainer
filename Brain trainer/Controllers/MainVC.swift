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
        
        configureButtons()
    }
    
    private func configureButtons() {
        mainView.easyLevelButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        mainView.highScoreButton.addTarget(self, action: #selector(highScoreButtonPressed), for: .touchUpInside)
        mainView.settingButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
    }
    
    private func segueTo(_ viewController: UIViewController, withStyle style: UIModalPresentationStyle) {
        let vc = viewController
        vc.modalPresentationStyle = style
        present(vc, animated: true)
    }
    
    @objc func startButtonPressed() {
        segueTo(GameVC(), withStyle: .fullScreen)
    }
    
    @objc func highScoreButtonPressed() {
        segueTo(BestTimeVC(), withStyle: .overFullScreen)
    }
    
    @objc func settingButtonPressed() {
        let popOver = SettingsVC()
        self.addChild(popOver)
        popOver.view.frame = self.view.frame
        self.view.addSubview(popOver.view)
        popOver.didMove(toParent: self)
    }
}

