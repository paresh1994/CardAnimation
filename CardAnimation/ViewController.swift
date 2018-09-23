//
//  ViewController.swift
//  CardAnimation
//
//  Created by Paresh on 9/16/18.
//  Copyright © 2018 Paresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewPlayerA: CardView!
    @IBOutlet weak var viewPlayerB: CardView!
    @IBOutlet weak var viewPlayerC: CardView!
    @IBOutlet weak var viewPlayerD: CardView!

    @IBOutlet weak var imageViewCard: UIImageView!
    
    var cardImageView = UIImageView()
    var cardImageViewFrame: CGRect!
    var count = 0

    var currentTurn: Int = 0
    var cards = [Cards]()
    
    var cardTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardImageView.image = UIImage(named: "card")
        self.view.addSubview(cardImageView)
        self.cardImageViewFrame = self.imageViewCard.frame
        self.cardImageView.frame = self.cardImageViewFrame
        self.cardImageView.isHidden = true
        
        self.cards = [
            Cards(player: "A", cardView: self.viewPlayerA),
            Cards(player: "B", cardView: self.viewPlayerB),
            Cards(player: "C", cardView: self.viewPlayerC),
            Cards(player: "D", cardView: self.viewPlayerD)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func findPosition(_ imageView: UIImageView, view: UIView) -> CGRect{
        let frame = view.convert(imageView.frame, to: self.view)
        return frame
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        self.cardAnimation()
        
        self.cardTimer.invalidate()
        self.cardTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.cardAnimation), userInfo: nil, repeats: true)
        
    }
    
    @objc fileprivate func cardAnimation() {
        
        guard self.currentTurn < 4 else {
            
            if count < 2 {
                print("Count value =>", count)
                self.count += 1
                self.currentTurn = 0
            }else {
                self.cardTimer.invalidate()
                self.count = 0
                self.currentTurn = 0
            }
            
            return
        }
        
        print("Player ==> ",self.cards[self.currentTurn].player)
        
        var frame = CGRect.zero
        
        switch self.count {
        case 0:
            frame = findPosition(self.cards[self.currentTurn].cardView.imageViewOne, view: self.cards[self.currentTurn].cardView)
        case 1:
            frame = findPosition(self.cards[self.currentTurn].cardView.imageViewTwo, view: self.cards[self.currentTurn].cardView)
        default:
            frame = findPosition(self.cards[self.currentTurn].cardView.imageViewThree, view: self.cards[self.currentTurn].cardView)
        }
        
        self.cardImageView.isHidden = false
        

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.cardImageView.frame.origin = frame.origin
        }) { (_) in
            self.currentTurn += 1
            self.cardImageView.frame.origin = self.cardImageViewFrame.origin
            self.cardImageView.isHidden = true
        }
    }
    
}

struct Cards {
    let player: String
    let cardView: CardView
}

