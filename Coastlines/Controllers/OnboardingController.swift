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
        if let secondView = view as? SecondOnboardingView {
            secondView.animateNextButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }
}
