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
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        setupWavyView()
        setupCollectionView()
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
}
