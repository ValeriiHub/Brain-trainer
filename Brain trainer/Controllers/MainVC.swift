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
    let settingsView = SettingsView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainView)
        mainView.frame = view.bounds
        
        configureButtons()
    }
    
    private func configureButtons() {
        mainView.easyLevelButton.addTarget(self, action: #selector(easyLevelButtonPressed), for: .touchUpInside)
        mainView.mediumLevelButton.addTarget(self, action: #selector(mediumLevelButtonPressed), for: .touchUpInside)
        mainView.hurdLevelButton.addTarget(self, action: #selector(hurdLevelButtonPressed), for: .touchUpInside)
        mainView.highScoreButton.addTarget(self, action: #selector(highScoreButtonPressed), for: .touchUpInside)
        mainView.settingButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
        settingsView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
    private func segueToGameWith(cardsInRow: Double, countOfCardPairs: Int, seconds: Int, countOfTimers: Int) {
        let vc = GameVC()
        vc.cardsInRow = cardsInRow
        vc.countOfCardPairs = countOfCardPairs
        vc.seconds = seconds
        vc.countOfTimers = countOfTimers
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    private func setCustom(_ view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            view.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func showAnimate(_ view: UIView) {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    
    private func removeAnimate(_ view: UIView) {
        UIView.animate(withDuration: 0.25) {
            view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            view.alpha = 0.0
        } completion: { finished in
            if finished {
                view.removeFromSuperview()
            }
        }
    }
    
    @objc private func easyLevelButtonPressed() {
        segueToGameWith(cardsInRow: 4, countOfCardPairs: 8, seconds: Level.easy.time, countOfTimers: 0)
    }
    
    @objc private func mediumLevelButtonPressed() {
        segueToGameWith(cardsInRow: 5, countOfCardPairs: 12, seconds: Level.medium.time, countOfTimers: 1)
    }
    
    @objc private func hurdLevelButtonPressed() {
        segueToGameWith(cardsInRow: 6, countOfCardPairs: 17, seconds: Level.hard.time, countOfTimers: 2)
    }
    
    @objc private func highScoreButtonPressed() {
        let vc = BestTimeVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @objc private func settingButtonPressed() {
        setCustom(settingsView)
        showAnimate(settingsView)
    }
    
    @objc private func closeButtonPressed() {
        removeAnimate(settingsView)
    }
}
