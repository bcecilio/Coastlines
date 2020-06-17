//
//  SecondOnboardingControllerViewController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {

    private let secondOnboardingView: UIView
    
    init(_ view: UIView){
        self.secondOnboardingView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init(coder:) is not implemented.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateChevrons()
    }
    
    override func loadView(){
        view = secondOnboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        secondOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }
}

extension OnboardingController {
    
    private func animateChevrons(){
        if let displayView = view as? SecondOnboardingView{
            displayView.animateNextButton()
        } else if let displayView = view as? ThirdOnboardingView{
            displayView.animateChevrons()
        } else if let displayView = view as? FourthOnboardingView{
            displayView.animateChevrons()
        } else if let displayView = view as? FifthOnboardingView{
            displayView.animatePrevButton()
        }
    }
    
}
