//
//  CardCVCell.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 25.01.2022.
//

import UIKit

class CardCVCell: UICollectionViewCell {
    
    //MARK: - Properties
    var card: Card?
    
    let frontImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Card1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Card0")
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            frontImageView.topAnchor.constraint(equalTo: self.topAnchor),
            frontImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            frontImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            frontImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            backImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func addSubviews() {
        [frontImageView, backImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    // MARK: - Helper Methods
    
    func setCard(_ card: Card) {
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        backImageView.alpha = 1
        frontImageView.alpha = 1
        backImageView.isHidden = false
    }
    
    func flip() {
        UIView.transition(from: backImageView,
                          to: frontImageView,
                          duration: 0.3,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
    }
    
    func flipBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontImageView,
                              to: self.backImageView,
                              duration: 0.3,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion: nil)
        }
    }
    
    func removeMatchedCards() {
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: .curveEaseOut,
                       animations: { self.frontImageView.alpha = 0 },
                       completion: nil)
    }
}
