//
//  GameVC.swift
//  Brain trainer
//
//  Created by Valerii Dulia on 24.01.2022.
//

import UIKit

class GameVC: UIViewController {
    
    //MARK: - Properties
    
    let gameView = GameView()
    let endLevelView = EndLevelView()
    let soundManager = SoundManager.shared
    
    var cardArray: [Card] = []
    var cardsInRow = 4.0
    var countOfCardPairs = 8
    var countOfTimers = 0
    var seconds = 60
    var firstFlippedCardIndex: IndexPath?
    var timer: Timer?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gameView)
        gameView.frame = view.bounds
        
        gameView.gameCollectionView.delegate = self
        gameView.gameCollectionView.dataSource = self
        
        configureButtons()
        
        cardArray = CardModel.getCarts(pairs: countOfCardPairs, timer: countOfTimers)
        
        startTimer()
    }
    
    //MARK: - Methods
    
    private func configureButtons() {
        gameView.closelButton.addTarget(self, action: #selector(closelButtonPressed), for: .touchUpInside)
        endLevelView.closeButton.addTarget(self, action: #selector(closelButtonPressed), for: .touchUpInside)
    }
    
    func checkForMatches(_ secondFlippedCardIndex: IndexPath) {
        
        let cardOneCell = gameView.gameCollectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCVCell
        let cardTwoCell = gameView.gameCollectionView.cellForItem(at: secondFlippedCardIndex) as? CardCVCell
        
        let cardOne = cardArray[firstFlippedCardIndex!.item]
        let cardTwo = cardArray[secondFlippedCardIndex.item]
        
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.removeMatchedCards()
            cardTwoCell?.removeMatchedCards()
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
            checkGameEnded()
        } else {
            soundManager.playSound(.nomatch)
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        firstFlippedCardIndex = nil
    }
    
    func checkGameEnded() {
        var isWon = true
        
        for card in cardArray {
            if card.isMatched == false {
                isWon = false
                break
            }
        }
        
        if isWon == true {
            if seconds > 0 {
                timer?.invalidate()
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                self.showPopUp(text: "You win!")
            }
        } else {
            if seconds > 0 {
                return
            }
            
            showPopUp(text: "You lose")
        }
    }
    
    func showPopUp(text: String) {
        endLevelView.settingsLabel.text = text
        gameView.setCustom(endLevelView)
        gameView.showAnimate(endLevelView)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerElapsed),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerElapsed() {
        seconds -= 1
        
        gameView.timerLabel.text = String(format:"%02i:%02i", seconds / 60 % 60, seconds % 60)
        
        if seconds <= 0 {
            timer?.invalidate()
            checkGameEnded()
        }
    }
    
    @objc func closelButtonPressed() {
        dismiss(animated: true)
    }
}

//MARK: - Extensions

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension GameVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCVCell
        
        cell.setCard(cardArray[indexPath.item])
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension GameVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = cardsInRow
        let paddingWidth = 10 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.size.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCVCell
        
        let card = cardArray[indexPath.item]
        
        if card.isFlipped == false && card.isMatched == false {
            soundManager.playSound(.flip)
            
            cell.flip()
            card.isFlipped = true
            
            if card.imageName == "timer" {
                soundManager.playSound(.explosion)
                configure(cell, and: card)
                
                if seconds > 20 {
                    timer?.invalidate()
                    seconds -= 20
                    
                    gameView.timerLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    gameView.timerLabel.text = "-20"
                    UIView.animate(withDuration: 0.25) {
                        self.gameView.timerLabel.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.gameView.timerLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }
                    startTimer()
                    checkGameEnded()
                } else {
                    self.timer?.invalidate()
                    self.gameView.timerLabel.text = "00:00"
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
                        self.showPopUp(text: "You lose")
                    }
                }
                return
            }
            
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
            } else {
                checkForMatches(indexPath)
            }
        }
    }
    
    func configure(_ cell: CardCVCell, and card: Card) {
        card.isMatched = true
        cell.removeMatchedCards()
        cell.flipBack()
    }
}
