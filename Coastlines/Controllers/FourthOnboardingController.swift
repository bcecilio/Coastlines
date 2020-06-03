//
//  FourthOnboardingController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FourthOnboardingController: UIViewController {

    private let fourthOnboardingView = FourthOnboardingView()
    
    override func loadView(){
        view = fourthOnboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        fourthOnboardingView.backgroundColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        fourthOnboardingView.leftSwipe.addTarget(self, action: #selector(swiped))
        fourthOnboardingView.rightSwipe.addTarget(self, action: #selector(swiped))
        fourthOnboardingView.nextButton.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
        fourthOnboardingView.prevButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc
    private func swiped(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            segueNext()
        } else if sender.direction == .right {
            goBack()
        }
    }
    
    @objc
    private func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func segueNext(){
        let fifthOnboardingVC = FifthOnboardingController()
        fifthOnboardingVC.modalPresentationStyle = .fullScreen
        fifthOnboardingVC.modalTransitionStyle = .crossDissolve
        present(fifthOnboardingVC, animated: true, completion: nil)
    }

}
