//
//  SettingsView.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class SettingsView: UIView {
    
    // MARK: - Properties
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.65
        return view
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.contentMode = .center
        button.layer.cornerRadius = 10
        button.setBackgroundImage(UIImage(named: "VioletButton"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    let musicLabel: UILabel = {
        let label = UILabel()
        label.text = "Music"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    let musicSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        slider.minimumTrackTintColor = UIColor(named: "PurpleSettingsColor")
        slider.minimumValueImage = UIImage(systemName: "volume.1")
        slider.maximumValueImage = UIImage(systemName: "volume.3")
        slider.tintColor = .black
        return slider
    }()
    
    let divisionLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let soundLabel: UILabel = {
        let label = UILabel()
        label.text = "Sound"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    let soundSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        slider.minimumTrackTintColor = UIColor(named: "PurpleSettingsColor")
        slider.minimumValueImage = UIImage(systemName: "volume.1")
        slider.maximumValueImage = UIImage(systemName: "volume.3")
        slider.tintColor = .black
        return slider
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            
            mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            mainView.heightAnchor.constraint(equalToConstant: 380),
        
            closeButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -23),
            closeButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 23),
            closeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
        
            settingsLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            settingsLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40),
            settingsLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40),

            musicLabel.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 20),
            musicLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            musicLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),

            musicSlider.topAnchor.constraint(equalTo: musicLabel.bottomAnchor, constant: 20),
            musicSlider.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            musicSlider.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),

            divisionLineView.topAnchor.constraint(equalTo: musicSlider.bottomAnchor, constant: 30),
            divisionLineView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            divisionLineView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            divisionLineView.heightAnchor.constraint(equalToConstant: 1),

            soundLabel.topAnchor.constraint(equalTo: divisionLineView.bottomAnchor, constant: 20),
            soundLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            soundLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),

            soundSlider.topAnchor.constraint(equalTo: soundLabel.bottomAnchor, constant: 20),
            soundSlider.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            soundSlider.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundView, mainView, closeButton, settingsLabel, musicLabel, musicSlider, divisionLineView, soundLabel, soundSlider].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
