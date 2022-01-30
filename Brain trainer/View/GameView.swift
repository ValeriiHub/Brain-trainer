//
//  GameView.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class GameView: UIView {
    
    // MARK: - Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let closelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Exit", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "purpleButton"), for: .normal)
        return button
    }()
    
    let pauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pause", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "purpleButton"), for: .normal)
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "0:00"
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let gameCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardCVCell.self, forCellWithReuseIdentifier: "CardCell")
        collectionView.backgroundColor = .clear
        return collectionView
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
            
            closelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            closelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 60),
            closelButton.widthAnchor.constraint(equalToConstant: 80),
            closelButton.heightAnchor.constraint(equalToConstant: 80),
            
            pauseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            pauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -60),
            pauseButton.widthAnchor.constraint(equalToConstant: 80),
            pauseButton.heightAnchor.constraint(equalToConstant: 80),
            
            timerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:40),
            timerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            timerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            timerLabel.heightAnchor.constraint(equalToConstant: 80),
            
            gameCollectionView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant:30),
            gameCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            gameCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            gameCollectionView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    // MARK: - Helper Methods
    
    private func addSubviews() {
        [backgroundImageView, closelButton, pauseButton, timerLabel, gameCollectionView].forEach {
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
