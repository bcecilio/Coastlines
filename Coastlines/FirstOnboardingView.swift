//
//  IntroView.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FirstOnboardingView: UIView {
    
    public lazy var nextButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    public lazy var welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome to Coastlines"
        label.textColor = UIColor.systemTeal
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFont(name: "Charter", size: 30)
        label.numberOfLines = 0
        label.alpha = 1.0
        return label
    }()
    
    public lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Thank you for installing this application. Before you begin your experience, we'd like to take a moment to inform you a bit about climate change and its effect on the global sea level."
        label.textColor = UIColor.systemTeal
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.font = UIFont(name: "Charter", size: 30)
        label.alpha = 1.0
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var skipButton: UIButton = {
       let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    public lazy var swipeRight: UISwipeGestureRecognizer = {
        let gesture = UISwipeGestureRecognizer()
        gesture.direction = .right
        return gesture
    }()
    
    public lazy var swipeLeft: UISwipeGestureRecognizer = {
       let gesture = UISwipeGestureRecognizer()
        gesture.direction = .left
        return gesture
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpWelcomeLabelConstraints()
        setUpWelcomeButtonConstaints()
        setUpInfoLabelConstraints()
        setUpSkipButtonConstraints()
        addGestureRecognizer(swipeRight)
        addGestureRecognizer(swipeLeft)
    }
    
    private func setUpWelcomeLabelConstraints(){
        addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([welcomeLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 10.0), welcomeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), welcomeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), welcomeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)])
    }
    
    private func setUpWelcomeButtonConstaints(){
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20), nextButton.heightAnchor.constraint(equalToConstant: 44), nextButton.widthAnchor.constraint(equalToConstant: 44)])
    }
    
    private func setUpInfoLabelConstraints() {
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: welcomeLabel.bottomAnchor, multiplier: 5.0), infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)])
    }
    
    private func setUpSkipButtonConstraints(){
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20), skipButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20), skipButton.heightAnchor.constraint(equalToConstant: 44), skipButton.widthAnchor.constraint(equalToConstant: 44)])
    }

}
