//
//  FourthOnboardingView.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FourthOnboardingView: UIView {

    public lazy var prevButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = PaletteColour.offWhite.colour
        button.addAccessibility(.button, "Left Chevron", "Indicates that the user can swipe right", nil)
        return button
    }()
    
    public lazy var nextButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = PaletteColour.offWhite.colour
        button.addAccessibility(.button, "Right Chevron", "Indicates that the user can swipe left", nil)
        return button
    }()
    
    public lazy var centerImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "coastlineIMG1")
        iv.addAccessibility(.image, "An image of a coast with waves receding from a bird's eye view", nil, nil)
        return iv
    }()
    
    public lazy var infoView: UITextView = {
       let view = UITextView()
        view.textColor = PaletteColour.offWhite.colour
        view.text = OnboardingText.thirdOnboardingLabel
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.isEditable = false
        view.backgroundColor = UIColor.clear
        view.addAccessibility(.none, OnboardingText.thirdOnboardingLabel, nil, nil)
        return view
    }()
    
    public lazy var skipButton: UIButton = {
       let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(PaletteColour.offWhite.colour, for: .normal)
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addAccessibility(.button, "Skip", "Skips the remainder of the onboarding process", nil)

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        // setUpCenterImageConstraints()
//        setUpPrevButtonConstraints()
//        setUpNextButtonConstraints()
        setUpSkipButtonConstraints()
        setUpInfoViewConstraints()
    }
    
    private func setUpPrevButtonConstraints(){
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([prevButton.centerYAnchor.constraint(equalTo: centerImage.centerYAnchor), prevButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8.0), prevButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), prevButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpNextButtonConstraints() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nextButton.centerYAnchor.constraint(equalTo: centerImage.centerYAnchor), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
//    private func setUpCenterImageConstraints() {
//        addSubview(centerImage)
//        centerImage.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([centerImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5.0), centerImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), centerImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), centerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.57)])
//    }
    
    private func setUpInfoViewConstraints() {
        addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([infoView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 50), infoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16), infoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16), infoView.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -8)])
    }
    
    private func setUpSkipButtonConstraints(){
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8), skipButton.centerXAnchor.constraint(equalTo: centerXAnchor), skipButton.heightAnchor.constraint(equalToConstant: 50.0), skipButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)])
    }
    
    @objc
    private func showLocationsVC(){
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
    
    public func animateChevrons(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat,.autoreverse], animations: {
            self.prevButton.transform = CGAffineTransform(translationX: -5.0, y: 0.0)
            self.prevButton.transform = CGAffineTransform(translationX: 5.0, y: 0.0)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.repeat,.autoreverse], animations: {
            self.nextButton.transform = CGAffineTransform(translationX: -5.0, y: 0.0)
            self.nextButton.transform = CGAffineTransform(translationX: 5.0, y: 0.0)
        })
    }

}
