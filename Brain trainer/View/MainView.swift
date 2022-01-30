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
        imageView.image = UIImage(named: "backGround2")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let highScoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("HIGH SCORE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "orangeButton"), for: .normal)
        return button
    }()
    
    let easyLevelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Easy", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "greenButton"), for: .normal)
        return button
    }()
    
    let mediumLevelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Medium", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blueButton"), for: .normal)
        return button
    }()
    
    let hurdLevelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hard", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "purpleButton"), for: .normal)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(named: "SettingsIcon"), for: .normal)
        return button
    }()
    
    private let sunImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.contentMode = .scaleToFill
        return imageView
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
            
            settingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            settingButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingButton.heightAnchor.constraint(equalToConstant: 40),
            settingButton.widthAnchor.constraint(equalToConstant: 40),
            
            highScoreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            highScoreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            highScoreButton.heightAnchor.constraint(equalToConstant: 100),
            highScoreButton.widthAnchor.constraint(equalToConstant: 100),
            
            mediumLevelButton.bottomAnchor.constraint(equalTo: highScoreButton.topAnchor, constant: -40),
            mediumLevelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -25),
            mediumLevelButton.heightAnchor.constraint(equalToConstant: 100),
            mediumLevelButton.widthAnchor.constraint(equalToConstant: 100),
            
            easyLevelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            easyLevelButton.trailingAnchor.constraint(equalTo: mediumLevelButton.leadingAnchor, constant: 5),
            easyLevelButton.heightAnchor.constraint(equalToConstant: 100),
            easyLevelButton.widthAnchor.constraint(equalToConstant: 100),
            
            hurdLevelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120),
            hurdLevelButton.leadingAnchor.constraint(equalTo: highScoreButton.trailingAnchor, constant: 1),
            hurdLevelButton.heightAnchor.constraint(equalToConstant: 100),
            hurdLevelButton.widthAnchor.constraint(equalToConstant: 100),
            
            sunImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            sunImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sunImageView.heightAnchor.constraint(equalToConstant: 100),
            sunImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundImageView, highScoreButton, mediumLevelButton, easyLevelButton, hurdLevelButton, settingButton, sunImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setCustom(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: self.heightAnchor),
            view.widthAnchor.constraint(equalTo: self.widthAnchor),
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func showAnimate(_ view: UIView) {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    
    func removeAnimate(_ view: UIView) {
        UIView.animate(withDuration: 0.25) {
            view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            view.alpha = 0.0
        } completion: { finished in
            if finished {
                view.removeFromSuperview()
            }
        }
    }
}
