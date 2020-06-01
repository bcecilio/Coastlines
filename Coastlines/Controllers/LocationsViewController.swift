//
//  LocationsViewController.swift
//  Coastlines
//
//  Created by Brendon Cecilio on 5/27/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {
    
    private let locationsView = LocationsVew()
    
    override func loadView() {
        view = locationsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationsView.collectionView.dataSource = self
        locationsView.collectionView.delegate = self
    }
}

// MARK: UICollectionViewDataSource/Delegate/DelegateFlowLayout

extension LocationsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Implement items
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as? LocationCell else {
            print("Failed to create cell")
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: "locationReusableView", withReuseIdentifier: UICollectionView.elementKindSectionHeader, for: indexPath) as? LocationReusableView else {
            print("Failed to create reusable view")
            return UICollectionReusableView()
        }
        
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width - 48, height:  240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Implement CGSize
        return CGSize(width: view.frame.width - 48, height: view.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Implement insets
        let verticalSpace = view.frame.height / 10
        return UIEdgeInsets(top: verticalSpace, left: 0, bottom: verticalSpace, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Implement didSelect
    }
}
