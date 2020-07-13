//
//  SecondOnboardingView.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class SecondOnboardingView: UIView {
    
    public lazy var nextButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = PaletteColour.offWhite.colour
        button.addAccessibility(.button, "Right chevron", "Indicates that the user can swipe left", nil)
        return button
    }()
    
    public lazy var skipButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = PaletteColour.offWhite.colour
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
//        button.layer.borderWidth = 1.0
//        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
//        button.layer.cornerRadius = 25.0
        button.makeFontAccessible()
        button.addAccessibility(.button, "X", "Skips the remainder of the onboarding experience", nil)
        return button
    }()
    
    public lazy var infoView: UITextView = {
       let view = UITextView()
        view.textAlignment = NSTextAlignment.center
        view.textColor = PaletteColour.offWhite.colour
        view.text = OnboardingText.firstOnboardingLabel
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.backgroundColor = UIColor.clear
        view.isEditable = false
        view.addAccessibility(.none, OnboardingText.firstOnboardingLabel, nil, nil)
        return view
    }()
    
    public lazy var transparentView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 1.0
        return view
    }()
    
    public lazy var centerImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "coastlineIMG5")
        imageView.addAccessibility(.image, "An image of an iceburg melting", nil, nil)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {

//        setUpImageViewConstraints()
        setUpSkipButtonConstraints()
//        setUpTransparentViewConstraints()
        setUpInfoViewConstraints()
//        setUpInfoViewConstraints()
        setUpNextButtonConstraints()
    }
    
    private func setUpNextButtonConstraints() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nextButton.centerYAnchor.constraint(equalTo: centerYAnchor), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpImageViewConstraints() {
        addSubview(centerImage)
        centerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([centerImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5.0), centerImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), centerImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), centerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.57)])
    }
    
    private func setUpInfoViewConstraints() {
        addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([infoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2), infoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor , constant: 16), infoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16), infoView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)])
    }
    
    private func setUpTransparentViewConstraints() {
        addSubview(transparentView)
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([transparentView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2), transparentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16), transparentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16), transparentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)])
    }
    
    private func setUpSkipButtonConstraints() {
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16), skipButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16), skipButton.heightAnchor.constraint(equalToConstant: 50.0), skipButton.widthAnchor.constraint(equalToConstant: 50.0)])
    }
    
    @objc
    private func showLocationsVC() {
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
    
    public func animateNextButton(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat,.autoreverse], animations: {
            self.nextButton.transform = CGAffineTransform(translationX: -5.0, y: 0.0)
            self.nextButton.transform = CGAffineTransform(translationX: 5.0, y: 0.0)
        })
    }
}

