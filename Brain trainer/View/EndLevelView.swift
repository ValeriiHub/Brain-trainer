//
//  EndLevelView.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 29.01.2022.
//

import UIKit

class EndLevelView: UIView {
    
    // MARK: - Properties
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.65
        return view
    }()
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let winTimeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .purple
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let winLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.contentMode = .center
        button.setBackgroundImage(UIImage(named: "VioletButton"), for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        return button
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        [backgroundView, mainView, closeButton, winTimeLabel, winLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            
            mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            mainView.heightAnchor.constraint(equalToConstant: 300),
            
            closeButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -23),
            closeButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 23),
            closeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            
            winLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 40),
            winLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            winLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            winTimeLabel.topAnchor.constraint(equalTo: winLabel.bottomAnchor, constant: 15),
            winTimeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            winTimeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            winTimeLabel.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundView, mainView, closeButton, winTimeLabel, winLabel].forEach {
            self.addSubview($0)
        }
    }
}
