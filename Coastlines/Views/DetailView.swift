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
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.contentMode = .scaleToFill
        button.layer.cornerRadius = 5
        return button
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
        collection.backgroundColor = PaletteColour.lightBlue.colour
        collection.register(TOCCell.self, forCellWithReuseIdentifier: "tocCell")
        collection.register(ContentCell.self, forCellWithReuseIdentifier: "contentCell")
        collection.register(GraphCell.self, forCellWithReuseIdentifier: "graphCell")
        collection.register(PieChartCell.self, forCellWithReuseIdentifier: "pieCell")
        collection.register(ARCell.self, forCellWithReuseIdentifier: "arCell")
        return collection
    }()
    
    public lazy var goToARButton: UIButton = {
        let button = UIButton()
        return button.arButton()
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
//        arButtonConstraints()
        backButtonConstraints()
        setupCollectionViewConstraints()
        arButtonConstraints()
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
    
    public func hideARButton() {
        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.goToARButton.alpha = 0
            
        })  { (completed) in
            self.goToARButton.isHidden = true
        }
    }
    
    public func showARButton() {
        UIView.animate(withDuration: 1.25, delay: 0, options: [.transitionCrossDissolve], animations: {
            
            self.goToARButton.isHidden = false
            self.goToARButton.alpha = 1
            
        })  { (completed) in
            
        }
    }
    
}
