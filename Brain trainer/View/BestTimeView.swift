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
        view.backgroundColor = .red
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let bestTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "BestTime"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "CloseButton"), for: .normal)
        return button
    }()
    
    private let easyLeveLabel: UILabel = {
        let label = UILabel()
        label.text = "EASY LEVEL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let easyLeveScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .green
        return label
    }()
    
    private let mediumLeveLabel: UILabel = {
        let label = UILabel()
        label.text = "MEDIUN LEVEL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let mediumLeveScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .yellow
        return label
    }()
    
    private let hurdLeveLabel: UILabel = {
        let label = UILabel()
        label.text = "HARD LEVEL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let hardLeveScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
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
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            easyLeveLabel.topAnchor.constraint(equalTo: bestTimeLabel.bottomAnchor, constant: 40),
            easyLeveLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            easyLeveLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            easyLeveLabel.heightAnchor.constraint(equalToConstant: 30),
            
            easyLeveScoreLabel.topAnchor.constraint(equalTo: easyLeveLabel.bottomAnchor, constant: 40),
            easyLeveScoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            easyLeveScoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            easyLeveScoreLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mediumLeveLabel.topAnchor.constraint(equalTo: easyLeveScoreLabel.bottomAnchor, constant: 40),
            mediumLeveLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mediumLeveLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            mediumLeveLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mediumLeveScoreLabel.topAnchor.constraint(equalTo: mediumLeveLabel.bottomAnchor, constant: 40),
            mediumLeveScoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mediumLeveScoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            mediumLeveScoreLabel.heightAnchor.constraint(equalToConstant: 30),
            
            hurdLeveLabel.topAnchor.constraint(equalTo: mediumLeveScoreLabel.bottomAnchor, constant: 40),
            hurdLeveLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            hurdLeveLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            hurdLeveLabel.heightAnchor.constraint(equalToConstant: 30),
            
            hardLeveScoreLabel.topAnchor.constraint(equalTo: hurdLeveLabel.bottomAnchor, constant: 40),
            hardLeveScoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            hardLeveScoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            hardLeveScoreLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundView, bestTimeLabel, closeButton, easyLeveLabel, easyLeveScoreLabel, mediumLeveLabel, mediumLeveScoreLabel, hurdLeveLabel, hardLeveScoreLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }

}
