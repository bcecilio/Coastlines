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
        thirdOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }
}
