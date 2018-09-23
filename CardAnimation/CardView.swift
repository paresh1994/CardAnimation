//
//  CardView.swift
//  CardAnimation
//
//  Created by Paresh on 9/22/18.
//  Copyright © 2018 Paresh. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commnInit()
    }
    
    override func draw(_ rect: CGRect) {
        let bgshapelayer = CAShapeLayer()
        bgshapelayer.path = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY), radius: (self.bounds.width - 20) / 2, startAngle: -90.degreesToRadins, endAngle: 270.degreesToRadins, clockwise: true).cgPath
        bgshapelayer.strokeColor = UIColor.white.cgColor
        bgshapelayer.fillColor = UIColor.clear.cgColor
        bgshapelayer.lineWidth = 5
        self.layer.addSublayer(bgshapelayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commnInit()
    }
    
    private func commnInit() {
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.imageViewProfile.image = UIImage(named: "user")
        self.imageViewOne.image = UIImage(named: "card")
        self.imageViewTwo.image = UIImage(named: "card")
        self.imageViewThree.image = UIImage(named: "card")
    }
    
    
    
}

extension Int {
    var degreesToRadins: CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
