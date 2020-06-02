//
//  ThridOnboardingController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ThirdOnboardingController: UIViewController {
    
    private let thirdOnboardingView = ThirdOnboardingView()
    
    override func loadView(){
        view = thirdOnboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        thirdOnboardingView.backgroundColor = GlobalColours.blueColour
        thirdOnboardingView.leftSwipe.addTarget(self, action: #selector(swiped))
        thirdOnboardingView.rightSwipe.addTarget(self, action: #selector(swiped))
        thirdOnboardingView.prevButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        thirdOnboardingView.nextButton.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
    }
    
    @objc
    private func swiped(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left {
            segueNext()
        } else if sender.direction == .right {
            goBack()
        }
    }
    
    @objc
    private func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func segueNext(){
        let nextVC = FourthOnboardingController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }

}
