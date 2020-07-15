//
//  UIButton+Extension.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/5/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension UIButton {
    func nextButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 44, height: 44)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.backgroundColor = PaletteColour.offWhite.colour
        button.contentMode = .scaleToFill
        button.tintColor = .black
        button.layer.borderWidth = 3
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.addTarget(self, action: #selector(animateButton2), for: .touchUpInside)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        button.layer.shadowRadius = 3
//        button.layer.shadowOpacity = 0.65
        button.layer.masksToBounds = false
        return button
    }
    
    func previousButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 44, height: 44)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.backgroundColor = PaletteColour.offWhite.colour
        button.contentMode = .scaleToFill
        button.tintColor = .black
        button.layer.borderWidth = 3
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.addTarget(self, action: #selector(animateButton2), for: .touchUpInside)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        button.layer.shadowRadius = 3
//        button.layer.shadowOpacity = 0.65
        button.layer.masksToBounds = false
        return button
    }
    
    func arButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 64, height: 64)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named:"ar2"), for: .normal)
        button.backgroundColor = PaletteColour.offWhite.colour
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.layer.borderWidth = 5
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.addTarget(self, action: #selector(animateButton2), for: .touchUpInside)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        button.layer.shadowRadius = 3
//        button.layer.shadowOpacity = 0.65
        button.layer.masksToBounds = false
        return button
    }
}

extension UIButton {
    /// Makes the font within a button dynamic. For accessibility purposes.
    func makeFontAccessible(){
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        self.titleLabel?.textAlignment = .center
    }
}

extension UIImageView {
    func hide() {
        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.alpha = 0
        },completion: nil)
    }
    
    func show() {
        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.alpha = 1
        },completion: nil)
    }
}

extension UIButton {
    
    func animateButton(functionClosure: @escaping () -> ()) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                functionClosure()
            }
        }
    }
    
    @objc func animateButton2() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}

