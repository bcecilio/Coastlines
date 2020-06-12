//
//  SecondOnboardingControllerViewController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class SecondOnboardingController: UIViewController {

    private let secondOnboardingView = SecondOnboardingView()
    
    override func loadView(){
        view = secondOnboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        secondOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
        secondOnboardingView.leftSwipe.addTarget(self, action: #selector(screenSwiped))
        secondOnboardingView.nextButton.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
    }
    
    @objc
    private func screenSwiped(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left {
            segueNext()
        }
    }
    
    @objc
    private func segueNext(){
        let nextVC = ThirdOnboardingController()
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }

}
