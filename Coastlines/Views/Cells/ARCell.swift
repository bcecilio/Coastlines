//
//  ARCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/7/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Lottie

class ARCell: UICollectionViewCell {
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = ContentText.seeInAR
        label.textAlignment = .center
        label.font = Font.cooper34
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    public lazy var arIconAnimation: AnimationView = {
        let v = AnimationView()
        v.animation = Animation.named("arIconAnimation")
        v.alpha = 0
        return v
    }()
    
    public lazy var tapARLabel: UILabel = {
        let label = UILabel()
        label.text = "To begin AR experience, tap button below!"
        label.textAlignment = .center
        label.font = Font.boldArial18
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.darkBlue.colour
        
        setupARAnimation()
        setupHeaderLabel()
        setupARLabel()
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupARAnimation() {
        addSubview(arIconAnimation)
        arIconAnimation.backgroundColor = .clear
        arIconAnimation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arIconAnimation.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            arIconAnimation.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arIconAnimation.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.2),
            arIconAnimation.heightAnchor.constraint(equalTo: arIconAnimation.widthAnchor)
        ])
    }
    
    private func setupARLabel() {
        addSubview(tapARLabel)
        tapARLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tapARLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            tapARLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tapARLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    public func showItems() {
        headerLabel.showItem()
        arIconAnimation.showItem()
        tapARLabel.showItem()
    }
    
    public func hideItems() {
        headerLabel.hideItem()
        arIconAnimation.hideItem()
        tapARLabel.hideItem()
    }
    
//    public func animateARIcon(){
////        UIView.animate(withDuration: 10, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
////            self.arIconAnimation.animation = Animation.named("ARAnimation")
////            self.arIconAnimation.play()
////            // self.arIconImage.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
////            // self.arIconImage.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
////        }, completion: nil)
//        arIconAnimation.animation = Animation.named("ARAnimation")
//        arIconAnimation.loopMode = .loop
//        arIconAnimation.play()
//    }
}
