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
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "Intro Page"
        introView.welcomeButton.addTarget(self, action: #selector(beginButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func beginButtonPressed(_ sender: UIButton){
          let nextVC = LocationsViewController()
          navigationController?.pushViewController(nextVC, animated: true)
    }

}
