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
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "Intro Page"
        introView.skipButton.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
        introView.swipeLeft.addTarget(self, action: #selector(swipedLeft))
        introView.nextButton.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
    }
    
    @objc
    private func skipButtonPressed(_ sender: UIButton){
        // TODO: Write Scene Change Logic 
        let nextVC = LocationsViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: true, completion: nil)
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
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: true, completion: nil)
    }

}
