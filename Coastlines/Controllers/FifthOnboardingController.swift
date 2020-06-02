//
//  FifthOnboardingController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FifthOnboardingController: UIViewController {

    private let fifthOnboardingView = FifthOnboardingView()
    
    override func loadView(){
        view = fifthOnboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        fifthOnboardingView.backgroundColor = GlobalColours.blueColour
        fifthOnboardingView.prevButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        fifthOnboardingView.rightSwipe.addTarget(self, action: #selector(goBack))
    }
    
    @objc
    private func swiped(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .right{
            goBack()
        }
    }
    
    @objc
    private func goBack(){
        dismiss(animated: true, completion: nil)
    }

}
