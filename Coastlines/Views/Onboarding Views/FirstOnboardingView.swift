//
//  FirstOnboardingView.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/8/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FirstOnboardingView: UIView {
    
    public lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Begin", for: .normal)
        button.setTitleColor(PaletteColour.offWhite.colour, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.layer.cornerRadius = 25.0
        button.addTarget(self, action: #selector(segueNext), for: .touchUpInside)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.addAccessibility(.button, "Get Started", "Begins onboarding experience", nil)
        return button
    }()
    
    public lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = OnboardingText.appTitle
        label.textColor = PaletteColour.lightBlue.colour
        label.textAlignment = NSTextAlignment.center
//        label.font = UIFont(name: "CooperHewitt-Medium", size: 30)
        label.font = .preferredFont(forTextStyle: .title1, compatibleWith: .current)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        label.addAccessibility(.none, OnboardingText.appTitle, nil, nil)
        return label
    }()
    
    public lazy var infoView: UITextView = {
        let view = UITextView()
        view.textColor = PaletteColour.offWhite.colour
        view.textAlignment = NSTextAlignment.left
//      field.font = UIFont(name: "CooperHewitt-Medium", size: 18)
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.text = OnboardingText.welcomeMessage
        view.backgroundColor = PaletteColour.lightBlue.colour
        view.addAccessibility(.none, OnboardingText.welcomeMessage, nil, nil)
        view.isEditable = false
        return view
    }()
    
    public lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(PaletteColour.offWhite.colour, for: .normal)
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
        button.addAccessibility(.button, "Skip", "Skips onboarding experience", nil)
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        //button.titleLabel?.
        button.layer.borderWidth = 1.0
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.layer.cornerRadius = 25.0
        return button
    }()
    
    public lazy var waves: TestView = {
        let wv = TestView()
        wv.backgroundColor = UIColor.clear
        return wv
    }()
    
    public lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = PaletteColour.offWhite.colour
        return view
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
        setUpTopViewConstraints()
        setUpSkipButtonConstraints()
        setUpTestViewConstraints()
        setUpNextButtonConstaints()
        setUpInfoViewConstraints()
        setUpWelcomeLabelConstraints()
//        animateNextButton()
    }
    
    private func setUpWelcomeLabelConstraints(){
        topView.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([welcomeLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5.0), welcomeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), welcomeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), welcomeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16)])
    }
    
    private func setUpNextButtonConstaints(){
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20), nextButton.heightAnchor.constraint(equalToConstant: 50.0), nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)])
    }
    
    private func setUpInfoViewConstraints() {
        addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([infoView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20), infoView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -16), infoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16), infoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
    private func setUpSkipButtonConstraints(){
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16), skipButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20), skipButton.heightAnchor.constraint(equalToConstant: 50.0), skipButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)])
    }
    
    private func setUpTestViewConstraints(){
        addSubview(waves)
        waves.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([waves.topAnchor.constraint(equalTo: topAnchor), waves.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), waves.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), waves.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.351)])
    }
    
    private func setUpTopViewConstraints() {
        addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([topView.topAnchor.constraint(equalTo: topAnchor), topView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), topView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)])
    }
    
    @objc
    private func showLocationsVC(){
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
    
    @objc
    private func segueNext(){
        let nextVC = PageController()
        UIViewController.resetWindow(nextVC)
    }
    
    private func animateNextButton(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.nextButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (completed) in
        }
    }
}
