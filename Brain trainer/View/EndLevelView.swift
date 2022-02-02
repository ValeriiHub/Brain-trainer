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
    
    let winTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .purple
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
    
    private let resultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "win")
        imageView.contentMode = .scaleToFill
        return imageView
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
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            mainView.heightAnchor.constraint(equalToConstant: 300),
            
            closeButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -23),
            closeButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 23),
            closeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5),
            resultImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40),
            resultImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40),
            resultImageView.heightAnchor.constraint(equalToConstant: 20),
            
            winTimeLabel.topAnchor.constraint(equalTo: resultImageView.bottomAnchor),
            winTimeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            winTimeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            winTimeLabel.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundView, mainView, closeButton, winTimeLabel, resultImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
