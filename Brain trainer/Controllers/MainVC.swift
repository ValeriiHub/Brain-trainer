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
    let soundManager = SoundManager.shared
    let musicManager = MusicManager.shared
    
    //MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        configureSound()
        musicManager.playSound()
    }
    
    //MARK: - Methods
    
    private func configureButtons() {
        mainView.easyLevelButton.addTarget(self, action: #selector(easyLevelButtonPressed), for: .touchUpInside)
        mainView.mediumLevelButton.addTarget(self, action: #selector(mediumLevelButtonPressed), for: .touchUpInside)
        mainView.hurdLevelButton.addTarget(self, action: #selector(hurdLevelButtonPressed), for: .touchUpInside)
        mainView.highScoreButton.addTarget(self, action: #selector(highScoreButtonPressed), for: .touchUpInside)
        mainView.settingButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
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
    
    private func configureSound() {
        musicManager.volume = Sound.musicManager
        soundManager.volume = Sound.soundManager
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
        let vc = SettingsVC()
        self.addChild(vc)
        vc.view.frame = self.view.bounds
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
