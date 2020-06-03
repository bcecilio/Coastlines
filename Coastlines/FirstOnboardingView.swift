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
        button.tintColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        return button
    }()
    
    public lazy var welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome to Coastlines"
        label.textColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Charter-Bold", size: 30)
        label.numberOfLines = 0
        label.alpha = 1.0
        return label
    }()
    
    public lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Thank you for installing this application. Before you begin your experience, we'd like to take a moment to inform you a bit about climate change and its effect on the global sea level."
        label.textColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Charter-Bold", size: 18)
        label.alpha = 1.0
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var skipButton: UIButton = {
       let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(PaletteColours.darkBlue.rawValue.convertHexToColour(), for: .normal)
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = PaletteColours.darkBlue.rawValue.convertHexToColour().cgColor
        button.layer.cornerRadius = 22.0
        return button
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
    
    /// An initializer used to set up constraints for custom views.
    private func commonInit(){
        setUpWelcomeLabelConstraints()
        setUpWelcomeButtonConstaints()
        setUpInfoLabelConstraints()
        setUpSkipButtonConstraints()
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
        
        NSLayoutConstraint.activate([nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20), nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpInfoLabelConstraints() {
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: welcomeLabel.bottomAnchor, multiplier: 5.0), infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)])
    }
    
    private func setUpSkipButtonConstraints(){
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20), skipButton.centerXAnchor.constraint(equalTo: centerXAnchor), skipButton.heightAnchor.constraint(equalToConstant: 44.0), skipButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)])
    }
    
    @objc
    private func showLocationsVC(){
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
}
