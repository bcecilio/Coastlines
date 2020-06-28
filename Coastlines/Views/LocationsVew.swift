//
//  LocationsVew.swift
//  Coastlines
//
//  Created by Brendon Cecilio on 5/27/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationsVew: UIView {

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(LocationCell.self, forCellWithReuseIdentifier: "locationCell")
        collection.register(LocationIntroCell.self, forCellWithReuseIdentifier: "introCell")
        // TODO: Fix paging, it's alignment sucks.
//        collection.isPagingEnabled = true
        return collection
    }()
    
    public lazy var wavyView: WavyView2 = {
        let wv = WavyView2()
        wv.backgroundColor = .clear
        return wv
    }()
    
    private lazy var resourceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Involved", for: .normal)
//        button.setImage(UIImage(named: "leafIcon"), for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = PaletteColour.lightGreen.colour
        button.addAccessibility(.button, "Get involved", nil, "Shows a list of actions that can be taken to reduce your carbon footprint.")
        button.makeFontAccessible()
//        button.layer.borderColor = PaletteColours.lightBlue.rawValue.convertHexToColour().cgColor
        button.addTarget(self, action: #selector(goToResourceVC), for: .touchUpInside)
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
    
    private func commonInit() {
        backgroundColor = PaletteColour.offWhite.colour
        setupWavyView()
        setupCollectionView()
        setupResourceButton()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupWavyView() {
        addSubview(wavyView)
        wavyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wavyView.topAnchor.constraint(equalTo: topAnchor),
            wavyView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1 / 4 ),
            wavyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wavyView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupResourceButton() {
        collectionView.addSubview(resourceButton)
        resourceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resourceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            resourceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resourceButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            resourceButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func goToResourceVC() {
        let resourceVC = ResourcesController()
        UIViewController.resetWindow(resourceVC)
    }
}
