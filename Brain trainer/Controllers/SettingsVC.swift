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
    let soundManager = SoundManager.shared
    let musicManager = MusicManager.shared
    
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
        configureSound()
    }
    
    //MARK: - Methods
    
    private func configureButtons() {
        settingsView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        settingsView.musicSlider.addTarget(self, action: #selector(musicSliderChanged(_:)), for: .valueChanged)
        settingsView.soundSlider.addTarget(self, action: #selector(soundSliderChanged(_:)), for: .valueChanged)
    }
    
    private func configureSound() {
        settingsView.musicSlider.value = Sound.musicManager
        settingsView.soundSlider.value = Sound.soundManager
    }
    
    private func showAnimate() {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    private func removeAnimate() {
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
    
    @objc private func musicSliderChanged(_ sender: UISlider) {
        musicManager.player?.volume = sender.value
        Sound.musicManager = sender.value
    }
    
    @objc private func soundSliderChanged(_ sender: UISlider) {
        soundManager.volume = sender.value
        Sound.soundManager = sender.value
    }
}
