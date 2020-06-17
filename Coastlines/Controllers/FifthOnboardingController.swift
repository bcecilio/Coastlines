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
        fifthOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }

}
