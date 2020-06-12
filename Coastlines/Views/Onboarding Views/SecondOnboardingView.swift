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
        return button
    }()
    
    public lazy var skipButton: UIButton = {
       let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(PaletteColour.darkBlue.colour, for: .normal)
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = PaletteColour.darkBlue.colour.cgColor
        button.layer.cornerRadius = 22.0
        return button
    }()
    
    public lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.textColor = PaletteColour.offWhite.colour
        label.text = OnboardingText.firstOnboardingLabel
        label.font = UIFont(name: "CooperHewitt-Medium", size: 18)
        return label
    }()
    
    public lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 1
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = PaletteColour.offWhite.colour
        pc.backgroundColor = PaletteColour.lightBlue.colour
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    public lazy var centerImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "coastlineIMG5")
        return imageView
    }()
    
    public lazy var leftSwipe: UISwipeGestureRecognizer = {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = .left
        return swipe
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
        setUpPageControlConstraints()
        setUpNextButtonConstraints()
        setUpImageViewConstraints()
        setUpInfoLabelConstraints()
        setUpSkipButtonConstraints()
        addGestureRecognizer(leftSwipe)
    }
    
    private func setUpPageControlConstraints(){
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([pageControl.centerXAnchor.constraint(equalTo: centerXAnchor), pageControl.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0), pageControl.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), pageControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)])
    }
    
    private func setUpNextButtonConstraints() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nextButton.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpImageViewConstraints() {
        addSubview(centerImage)
        centerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([centerImage.topAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 5.0), centerImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), centerImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), centerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.57)])
    }
    
    private func setUpInfoLabelConstraints(){
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: centerImage.bottomAnchor, multiplier: 2.0), infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16), infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
    private func setUpSkipButtonConstraints(){
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8), skipButton.heightAnchor.constraint(equalToConstant: 44.0), skipButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3), skipButton.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    @objc
    private func showLocationsVC(){
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
}

