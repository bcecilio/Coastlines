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
        fourthOnboardingView.backgroundColor = PaletteColour.darkBlue.colour
    }
}
