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
    var timer: Timer?
    
    var cardArray: [Card] = []
    var cardsInRow = Level.easy.cardsCount
    var countOfCardPairs = 8
    var countOfTimers = 0
    var seconds = Level.easy.time
    var firstFlippedCardIndex: IndexPath?
    
    //MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.gameCollectionView.delegate = self
        gameView.gameCollectionView.dataSource = self
        
        configureButtons()
        
        cardArray = Card.getCarts(pairs: countOfCardPairs, timer: countOfTimers)
        gameView.timerLabel.text = K.convertTimeToText(from: seconds)
        
        startTimer()
    }
    
    //MARK: - Methods
    
    private func configureButtons() {
        gameView.closelButton.addTarget(self, action: #selector(closelButtonPressed), for: .touchUpInside)
        gameView.pauseButton.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside)
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
            if !card.isMatched {
                isWon = false
                break
            }
        }
        
        if isWon {
            if seconds > 0 {
                timer?.invalidate()
                
                
                switch cardsInRow {
                case Level.easy.cardsCount:
                    if BestScore.easyLevel == 0 {
                        BestScore.easyLevel = (Level.easy.time - seconds)
                    } else if BestScore.easyLevel > (Level.easy.time - seconds) {
                        BestScore.easyLevel = (Level.easy.time - seconds)
                    }
                case Level.medium.cardsCount:
                    if BestScore.mediumLevel == 0 {
                        BestScore.mediumLevel = (Level.medium.time - seconds)
                    } else if BestScore.mediumLevel > (Level.medium.time - seconds) {
                        BestScore.mediumLevel = (Level.medium.time - seconds)
                    }
                case Level.hard.cardsCount:
                    if BestScore.hardLevel == 0 {
                        BestScore.hardLevel = (Level.hard.time - seconds)
                    } else if BestScore.hardLevel > (Level.hard.time - seconds) {
                        BestScore.hardLevel = (Level.hard.time - seconds)
                    }
                default:
                    break
                }
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
        endLevelView.winTimeLabel.text = text
        setCustom(endLevelView)
        showAnimate(endLevelView)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerElapsed),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func setCustom(_ view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            view.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
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
    
    @objc func timerElapsed() {
        seconds -= 1
        print(seconds)
        gameView.timerLabel.text = K.convertTimeToText(from: seconds)
        
        if seconds <= 0 {
            timer?.invalidate()
            checkGameEnded()
        }
    }
    
    @objc func closelButtonPressed() {
        dismiss(animated: true) {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    @objc func pauseButtonPressed() {
        timer?.invalidate()
        
        let vc = SettingsVC()
        vc.delegate = self
        self.addChild(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}

//MARK: - Extensions

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension GameVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CardCVCellIdentifier, for: indexPath) as! CardCVCell
        
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
            
            if card.imageName == K.cardImageNameTimer {
                soundManager.playSound(.timer)
                configure(cell, and: card)
                
                if seconds > 20 {
                    timer?.invalidate()
                    seconds -= 20
                    
                    gameView.timerLabel.text = K.bombDeltaTimeText
                    
                    UIView.animate(withDuration: 0.25) {
                        self.gameView.timerLabel.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.25) {
                            self.gameView.timerLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        }
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

extension GameVC: CloseButtonDelegate {
    func continueTimer() {
        startTimer()
    }
}
