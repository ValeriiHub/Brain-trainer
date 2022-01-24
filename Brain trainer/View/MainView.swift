//
//  MainView.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let highScoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("HIGH SCORE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setImage(UIImage(named: "settingButton"), for: .normal)
        return button
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            highScoreButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            highScoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            highScoreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            highScoreButton.heightAnchor.constraint(equalToConstant: 55),
            
            startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            startButton.bottomAnchor.constraint(equalTo: highScoreButton.topAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 55),
            
            settingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            settingButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingButton.heightAnchor.constraint(equalToConstant: 30),
            settingButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundImageView, highScoreButton, startButton, settingButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
