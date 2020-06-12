//
//  IntroViewController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FirstOnboardingController: UIViewController {

    private let introView = FirstOnboardingView()
    
    override func loadView(){
        view = introView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        view.backgroundColor = PaletteColour.lightBlue.colour
        introView.swipeLeft.addTarget(self, action: #selector(swipedLeft))
        introView.nextButton.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
    }
    
    @objc
    private func swipedLeft(_ gesture: UISwipeGestureRecognizer){
        if gesture.direction == .left {
            segueNext()
        }
    }
    
    @objc
    private func segueNext(){
        let nextVC = SecondOnboardingController()
        UIViewController.resetWindow(nextVC)
    }
}
