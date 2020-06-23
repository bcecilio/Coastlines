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
        label.alpha = 1
        return label
    }()
    
//    public lazy var arIconImage: UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named: "ar5")
//        return iv
//    }()
    
    public lazy var arIconAnimation: AnimationView = {
        let v = AnimationView()
        v.animation = Animation.named("arIconAnimation")
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.lightBlue.colour
        
        setupHeaderLabel()
        setupARAnimation()
        animateLabel()
//        animateARIcon()
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.headerLabel.alpha = 1
            
        }, completion: nil)
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
    
//    private func setupARIcon() {
//        addSubview(arIconImage)
//        arIconImage.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            arIconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
//            arIconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            arIconImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
//            arIconImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35)
//        ])
//    }
    
    private func setupARAnimation() {
        addSubview(arIconAnimation)
        arIconAnimation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arIconAnimation.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            arIconAnimation.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arIconAnimation.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            arIconAnimation.heightAnchor.constraint(equalTo: arIconAnimation.heightAnchor, multiplier: 1)
        ])
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
