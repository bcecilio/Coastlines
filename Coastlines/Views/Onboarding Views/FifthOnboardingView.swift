//
//  FifthOnboardingView.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FifthOnboardingView: UIView {

    public lazy var prevButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = PaletteColour.offWhite.colour
        button.addAccessibility(.button, "Left Chevron", "Indicates that the user can swipe right", nil)
        return button
    }()
    
    public lazy var centralImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "coastlineIMG3")
        iv.addAccessibility(.image, "An image of a glacier floating in frigid water with trees in the distant background.", nil, nil)
        return iv
    }()
    
    public lazy var infoView: UITextView = {
       let view = UITextView()
        view.textColor = PaletteColour.offWhite.colour
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.text = OnboardingText.fourthOnboardingLabel
        view.isEditable = false
        view.backgroundColor = PaletteColour.darkBlue.colour
        view.addAccessibility(.none, OnboardingText.fourthOnboardingLabel, nil, nil)
        return view
    }()
    
    public lazy var beginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Explore", for: .normal)
        button.setTitleColor(PaletteColour.offWhite.colour, for: .normal)
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addAccessibility(.button, "Begin", "Begin the main application experience.", nil)
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
        // setUpCentralImageConstraints()
        setUpPrevButtonConstraints()
        setUpBeginButtonConstraints()
        setUpInfoViewConstraints()
    }
    
    private func setUpPrevButtonConstraints(){
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([prevButton.centerYAnchor.constraint(equalTo: centralImage.centerYAnchor), prevButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), prevButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), prevButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
//    private func setUpCentralImageConstraints() {
//        addSubview(centralImage)
//        centralImage.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([centralImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5.0), centralImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), centralImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), centralImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.57)])
//    }
    
    private func setUpInfoViewConstraints(){
        addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 400), infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0), infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0)])
    }
    
    private func setUpBeginButtonConstraints(){
        addSubview(beginButton)
        beginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([beginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8), beginButton.centerXAnchor.constraint(equalTo: centerXAnchor), beginButton.heightAnchor.constraint(equalToConstant: 50.0), beginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)])
    }
    
    @objc
    private func showLocationsVC() {
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
    
    public func animatePrevButton(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat,.autoreverse], animations: {
            self.prevButton.transform = CGAffineTransform(translationX: -5.0, y: 0.0)
            self.prevButton.transform = CGAffineTransform(translationX: 5.0, y: 0.0)
        })
    }

}
