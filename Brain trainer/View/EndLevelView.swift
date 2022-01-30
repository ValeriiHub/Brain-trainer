//
//  EndLevelView.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 29.01.2022.
//

import UIKit

class EndLevelView: UIView {
    
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
        label.text = "You lose"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.contentMode = .center
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
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
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundView, mainView, closeButton, settingsLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
