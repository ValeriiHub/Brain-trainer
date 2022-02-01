//
//  BestTimeView.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class BestTimeView: UIView {
    // MARK: - Properties
    
    private let backgroundView: UIView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let bestTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "BEST TIME"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "clear"), for: .normal)
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private let easyLevelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenLabel")
        return imageView
    }()
    
    private let easyLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "EASY LEVEL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let easyLeveScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(String(format:"%02i:%02i", BestScore.easyLevel / 60 % 60, BestScore.easyLevel % 60))"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let mediumLeveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blueLabel")
        return imageView
    }()
    
    private let mediumLeveLabel: UILabel = {
        let label = UILabel()
        label.text = "MEDIUN LEVEL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let mediumLeveScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(String(format:"%02i:%02i", BestScore.mediumLevel / 60 % 60, BestScore.mediumLevel % 60))"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let hurdLeveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "orangeLabel")
        return imageView
    }()
    
    private let hurdLeveLabel: UILabel = {
        let label = UILabel()
        label.text = "HARD LEVEL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let hardLeveScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(String(format:"%02i:%02i", BestScore.hardLevel / 60 % 60, BestScore.hardLevel % 60))"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            bestTimeLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            bestTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bestTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            closeButton.centerYAnchor.constraint(equalTo: bestTimeLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            easyLevelImageView.topAnchor.constraint(equalTo: bestTimeLabel.bottomAnchor, constant: 50),
            easyLevelImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            easyLevelImageView.widthAnchor.constraint(equalToConstant: 220),
            easyLevelImageView.heightAnchor.constraint(equalToConstant: 100),
            
            easyLevelLabel.topAnchor.constraint(equalTo: easyLevelImageView.topAnchor, constant: 10),
            easyLevelLabel.leadingAnchor.constraint(equalTo: easyLevelImageView.leadingAnchor),
            easyLevelLabel.trailingAnchor.constraint(equalTo: easyLevelImageView.trailingAnchor),
            easyLevelLabel.heightAnchor.constraint(equalToConstant: 30),
            
            easyLeveScoreLabel.topAnchor.constraint(equalTo: easyLevelLabel.bottomAnchor, constant: 5),
            easyLeveScoreLabel.leadingAnchor.constraint(equalTo: easyLevelImageView.leadingAnchor),
            easyLeveScoreLabel.trailingAnchor.constraint(equalTo: easyLevelImageView.trailingAnchor),
            easyLeveScoreLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mediumLeveImageView.topAnchor.constraint(equalTo: easyLevelImageView.bottomAnchor, constant: 50),
            mediumLeveImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mediumLeveImageView.widthAnchor.constraint(equalToConstant: 220),
            mediumLeveImageView.heightAnchor.constraint(equalToConstant: 100),
            
            mediumLeveLabel.topAnchor.constraint(equalTo: mediumLeveImageView.topAnchor, constant: 10),
            mediumLeveLabel.leadingAnchor.constraint(equalTo: mediumLeveImageView.leadingAnchor),
            mediumLeveLabel.trailingAnchor.constraint(equalTo: mediumLeveImageView.trailingAnchor),
            mediumLeveLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mediumLeveScoreLabel.topAnchor.constraint(equalTo: mediumLeveLabel.bottomAnchor, constant: 5),
            mediumLeveScoreLabel.leadingAnchor.constraint(equalTo: mediumLeveImageView.leadingAnchor),
            mediumLeveScoreLabel.trailingAnchor.constraint(equalTo: mediumLeveImageView.trailingAnchor),
            mediumLeveScoreLabel.heightAnchor.constraint(equalToConstant: 30),
            
            hurdLeveImageView.topAnchor.constraint(equalTo: mediumLeveImageView.bottomAnchor, constant: 50),
            hurdLeveImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hurdLeveImageView.widthAnchor.constraint(equalToConstant: 220),
            hurdLeveImageView.heightAnchor.constraint(equalToConstant: 100),
            
            hurdLeveLabel.topAnchor.constraint(equalTo: hurdLeveImageView.topAnchor, constant: 10),
            hurdLeveLabel.leadingAnchor.constraint(equalTo: hurdLeveImageView.leadingAnchor),
            hurdLeveLabel.trailingAnchor.constraint(equalTo: hurdLeveImageView.trailingAnchor),
            hurdLeveLabel.heightAnchor.constraint(equalToConstant: 30),
            
            hardLeveScoreLabel.topAnchor.constraint(equalTo: hurdLeveLabel.bottomAnchor, constant: 5),
            hardLeveScoreLabel.leadingAnchor.constraint(equalTo: hurdLeveImageView.leadingAnchor),
            hardLeveScoreLabel.trailingAnchor.constraint(equalTo: hurdLeveImageView.trailingAnchor),
            hardLeveScoreLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundView, bestTimeLabel, closeButton, easyLevelImageView, easyLevelLabel, easyLeveScoreLabel, mediumLeveImageView, mediumLeveLabel, mediumLeveScoreLabel, hurdLeveImageView, hurdLeveLabel, hardLeveScoreLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
