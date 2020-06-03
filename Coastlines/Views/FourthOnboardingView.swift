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
        button.tintColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        return button
    }()
    
    public lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.currentPage = 2
        pc.currentPageIndicatorTintColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        pc.backgroundColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    public lazy var nextButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        return button
    }()
    
    public lazy var centerImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "coastlineIMG1")
        return iv
    }()
    
    public lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.textColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        label.text = "Roughly 40% of the world’s population lives near Coastal Regions. If the sea level continues to rise at this rate, storms will increase in severity, flooding will become more frequent, and the coast will slowly recede."
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "CooperHewitt-Medium", size: 18)
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
    
    public lazy var leftSwipe: UISwipeGestureRecognizer = {
       let swipe = UISwipeGestureRecognizer()
        swipe.direction = .left
        return swipe
    }()
    
    public lazy var rightSwipe: UISwipeGestureRecognizer = {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = .right
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
        setUpPrevButtonConstraints()
        setUpPageControlConstraints()
        setUpNextButtonConstraints()
        setUpCenterImageConstraints()
        setUpInfoLabelConstraints()
        setUpSkipButtonConstraints()
        addGestureRecognizer(leftSwipe)
        addGestureRecognizer(rightSwipe)
    }
    
    private func setUpPrevButtonConstraints(){
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([prevButton.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0), prevButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8.0), prevButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), prevButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpPageControlConstraints() {
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([pageControl.centerXAnchor.constraint(equalTo: centerXAnchor), pageControl.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0), pageControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3), pageControl.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)])
    }
    
    private func setUpNextButtonConstraints() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nextButton.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0), nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpCenterImageConstraints() {
        addSubview(centerImage)
        centerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([centerImage.topAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 5.0), centerImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), centerImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), centerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)])
    }
    
    private func setUpInfoLabelConstraints() {
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: centerImage.bottomAnchor, multiplier: 2.0), infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)])
    }
    
    private func setUpSkipButtonConstraints(){
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([skipButton.topAnchor.constraint(equalToSystemSpacingBelow: infoLabel.bottomAnchor, multiplier: 2.7), skipButton.centerXAnchor.constraint(equalTo: centerXAnchor), skipButton.heightAnchor.constraint(equalToConstant: 44.0), skipButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)])
    }
    
    @objc
    private func showLocationsVC(){
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }

}