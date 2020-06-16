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
    }
}
