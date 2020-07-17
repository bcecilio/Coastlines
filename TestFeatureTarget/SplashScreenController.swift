//
//  SplashScreenController.swift
//  TestFeatureTarget
//
//  Created by Cameron Rivera on 7/16/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class SplashScreenController: UIViewController {

    private let ssView = SplashScreenView()
    private let halfOfScreen = UIScreen.main.bounds.height / 2
    
    override func loadView() {
        view = ssView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ssView.backgroundColor = PaletteColour.offWhite.colour
        playAnimation()
    }
    
    private func playAnimation() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: [.curveEaseOut], animations: {
            self.ssView.imageView.transform = CGAffineTransform(translationX: 0, y: -(self.halfOfScreen))
        }) { (_) in
            self.ssView.toggleImageViews()
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.ssView.hiddenImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }) { (_) in
                UIView.animate(withDuration: 0.6, animations: {
                    self.ssView.hiddenImageView.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                }) { (_) in
                    self.segueToWelcome()
                }
            }
        }
    }
    
    private func segueToWelcome() {
        guard let scene = UIApplication.shared.connectedScenes.first, let sceneDelegate = scene.delegate as? SceneDelegate else { return }
        UIView.transition(with: ssView, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        sceneDelegate.loadWelcomeScreen()
    }

}
