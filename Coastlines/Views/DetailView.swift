//
//  DetailView.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/4/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

class DetailView: UIView {
    
    public lazy var backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.compact.left"), for: .normal)
        button.addAccessibility(.button, "Back Button", nil, "Brings you back to the previous screen with a selection of locations.")
        button.backgroundColor = .clear
        button.tintColor = PaletteColour.offWhite.colour
        button.contentMode = .scaleToFill
        button.layer.cornerRadius = 5
        return button
    }()
    
    public lazy var infoButton: UIButton = {
        var button = UIButton()
        button = button.nextButton()
        button.setImage(UIImage(named: "info1"), for: .normal)
        button.addAccessibility(.button, "Resources", nil, "Shows a list of actions that can be taken to reduce your carbon footprint.")
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    public lazy var nextButton: UIButton = {
        let button = UIButton()
        return button.nextButton()
    }()
    
    public lazy var prevButton: UIButton = {
        let button = UIButton()
        return button.previousButton()
    }()
    
    public lazy var headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    public lazy var imageOne: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    public lazy var wView: WavyView = {
        let wavy = WavyView()
        wavy.backgroundColor = .clear
        return wavy
    }()
    
    public lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = PaletteColour.offWhite.colour
        return label
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = PaletteColour.darkBlue.colour
        collection.register(TOCCell.self, forCellWithReuseIdentifier: "tocCell")
        collection.register(ContentCell.self, forCellWithReuseIdentifier: "contentCell")
        collection.register(GraphCell.self, forCellWithReuseIdentifier: "graphCell")
        collection.register(PieChartCell.self, forCellWithReuseIdentifier: "pieCell")
        collection.register(ARCell.self, forCellWithReuseIdentifier: "arCell")
        return collection
    }()
    
    public lazy var goToARButton: UIButton = {
        var button = UIButton()
        button = button.arButton()
        button.addAccessibility(.button, "Augmented Reality", nil, "Will bring you to an IMPACTFUL!!! augmented reality experience.")
        return button
    }()
    
    var nameLabelLeading: NSLayoutConstraint!
    var wavyLeading: NSLayoutConstraint!
    var imageLeading: NSLayoutConstraint!
    var imageTrailing: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        headerContainer()
        setupLocationImageConstraints()
        setupWaveView()
        setupLocationLabel()
        backButtonConstraints()
        infoButtonConstraints()
        setupCollectionViewConstraints()
        arButtonConstraints()
        nextButtonConstraints()
        prevButtonConstraints()
    }
    
    private func headerContainer() {
        addSubview(headerContainerView)
        
        self.headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupLocationImageConstraints() {
        
        headerContainerView.addSubview(imageOne)
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        
        imageLeading = imageOne.leadingAnchor.constraint(equalTo: leadingAnchor)
        imageLeading.isActive = true
        imageTrailing = imageOne.trailingAnchor.constraint(equalTo: trailingAnchor)
        imageTrailing.isActive = true
        
        NSLayoutConstraint.activate([
            imageOne.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            imageOne.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
        
    }
    
    private func setupWaveView() {
        headerContainerView.addSubview(wView)
        wView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: self.frame.width * 6),
            wView.topAnchor.constraint(equalTo: imageOne.topAnchor),
            wView.heightAnchor.constraint(equalTo: imageOne.heightAnchor)
        ])
        
        wavyLeading = wView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        wavyLeading.isActive = true
    }
    
    private func setupLocationLabel() {
        imageOne.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            locationLabel.bottomAnchor.constraint(equalTo: imageOne.bottomAnchor, constant: -10),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
        
        nameLabelLeading = locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        nameLabelLeading.isActive = true
        
    }
    
    private func setupCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: wView.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: wView.trailingAnchor, constant: -40),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func arButtonConstraints() {
        addSubview(goToARButton)
        goToARButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goToARButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            goToARButton.widthAnchor.constraint(equalToConstant: 64),
            goToARButton.heightAnchor.constraint(equalToConstant: 64),
            goToARButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    private func nextButtonConstraints() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: goToARButton.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.heightAnchor.constraint(equalToConstant: 44),
            nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func prevButtonConstraints() {
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            prevButton.centerYAnchor.constraint(equalTo: goToARButton.centerYAnchor),
            prevButton.widthAnchor.constraint(equalToConstant: 44),
            prevButton.heightAnchor.constraint(equalToConstant: 44),
            prevButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    private func backButtonConstraints() {
        addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 34),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40)
        ])
    }
    
    private func infoButtonConstraints() {
        addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoButton.widthAnchor.constraint(equalToConstant: 44),
            infoButton.heightAnchor.constraint(equalToConstant: 44),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40)
        ])
    }
    
    public func hideARButton() {
//        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
//            self.goToARButton.alpha = 0
//
//        })  { (completed) in
//            self.goToARButton.isHidden = true
//        }
        goToARButton.pulsate()
    }
    
    public func showARButton() {
//        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
//
//            self.goToARButton.isHidden = false
//            self.goToARButton.alpha = 1
//
//        })  { (completed) in
//
//        }
        goToARButton.pulsate(1, 1)
    }
    
    public func hidePrev(delay: TimeInterval = 0) {
        UIView.animate(withDuration: 1.25, delay: delay, options: [.transitionCrossDissolve], animations: {
            
            self.prevButton.alpha = 0
            
        },completion: nil)
    }
    
    public func showPrev(delay: TimeInterval = 0) {
        UIView.animate(withDuration: 1.25, delay: delay, options: [.transitionCrossDissolve], animations: {
            
            self.prevButton.alpha = 1
            
        },completion: nil)
    }
    
    public func hideNext() {
        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
            
            self.nextButton.alpha = 0
            
        },completion: nil)
    }
    
    public func showNext() {
        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
            
            self.nextButton.alpha = 1
            
        },completion: nil)
    }
    
}

extension UIButton {
    func pulsate(_ start: Float = 0.97, _ stop: Float = 1.1) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.7
        pulse.fromValue = start
        pulse.toValue = stop
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0
        pulse.damping = 5
        layer.add(pulse, forKey: nil)
    }
}
