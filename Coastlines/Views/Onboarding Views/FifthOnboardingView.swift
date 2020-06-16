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
        return button
    }()
    
    public lazy var centralImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "coastlineIMG3")
        return iv
    }()
    
    public lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.textColor = PaletteColour.offWhite.colour
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.font = UIFont(name: "CooperHewitt-Medium", size: 18)
        label.text = OnboardingText.fourthOnboardingLabel
        return label
    }()
    
    public lazy var beginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Begin", for: .normal)
        button.setTitleColor(PaletteColour.offWhite.colour, for: .normal)
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(showLocationsVC), for: .touchUpInside)
        button.layer.cornerRadius = 22
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
        setUpCentralImageConstraints()
        setUpInfoLabelConstraints()
        setUpBeginButtonConstraints()
        setUpPrevButtonConstraints()
        animatePrevButton()
    }
    
    private func setUpPrevButtonConstraints(){
        centralImage.addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([prevButton.centerYAnchor.constraint(equalTo: centerYAnchor), prevButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), prevButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05), prevButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07)])
    }
    
    private func setUpCentralImageConstraints() {
        addSubview(centralImage)
        centralImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([centralImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5.0), centralImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), centralImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), centralImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)])
    }
    
    private func setUpInfoLabelConstraints(){
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: centralImage.bottomAnchor, multiplier: 2.0), infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0), infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0)])
    }
    
    private func setUpBeginButtonConstraints(){
        addSubview(beginButton)
        beginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([beginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8), beginButton.centerXAnchor.constraint(equalTo: centerXAnchor), beginButton.heightAnchor.constraint(equalToConstant: 44.0), beginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)])
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
