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
        secondOnboardingView.backgroundColor = UIColor.systemBackground
        secondOnboardingView.leftSwipe.addTarget(self, action: #selector(screenSwiped))
        secondOnboardingView.nextButton.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
        secondOnboardingView.skipButton.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
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
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc
    private func skipButtonPressed(_ sender: UIButton){
        // TODO: Write Scene Change Logic
        // let locationVC = LocationsViewController()
        print("Skipped")
    }

}
