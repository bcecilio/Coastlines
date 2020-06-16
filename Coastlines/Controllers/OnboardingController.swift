//
//  SecondOnboardingControllerViewController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
    
    private var secondOnboardingView: UIView
    
    init(_ view: UIView){
        self.secondOnboardingView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initializer not implemented.")
    }
    
    override func loadView(){
        view = secondOnboardingView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateChevrons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }
}

extension OnboardingController {
    
    func animateChevrons(){
        if let second = self.view as? SecondOnboardingView {
            second.animateNextButton()
        } else if let third = self.view as? ThirdOnboardingView{
            third.animateButtons()
        } else if let fourth = self.view as? FourthOnboardingView{
            fourth.animateButtons()
        } else if let fifth = self.view as? FifthOnboardingView{
            fifth.animatePrevButton()
        }
    }
}
