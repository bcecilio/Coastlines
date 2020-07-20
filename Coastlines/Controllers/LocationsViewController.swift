//
//  LocationsViewController.swift
//  Coastlines
//
//  Created by Brendon Cecilio on 5/27/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {
    
    private let locationsView = LocationsView()
    private let locations = LocationCell.Location.allCases
    private let locationData = FactsData.getLocations()
    private var selectedLocation = FactsData.getLocations()[0]
    
    /// Captures the last value of the x coordinate of the collection view.
    private lazy var oldValue = locationsView.collectionView.contentOffset.x
    
    override func loadView() {
        view = locationsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsView.collectionView.dataSource = self
        locationsView.collectionView.delegate = self
        locationsView.pageControl.numberOfPages = locations.count
        locationsView.pageControl.currentPage = 0
    }
    
    private func calculatePageControl(_ scrollView: UIScrollView){
        let offset = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        locationsView.pageControl.currentPage = Int((offset + horizontalCenter) / width)
    }
}

// MARK: UICollectionViewDataSource/Delegate/DelegateFlowLayout

extension LocationsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as? LocationCell else {
            fatalError("Failed to create locationCell")
        }
        
        cell.configureCell(locations[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemHeight: CGFloat = maxSize.height / 2.75
        
        return  CGSize(width: maxSize.width, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let verticalSpace = view.frame.height / 5
        return UIEdgeInsets(top: verticalSpace, left: 0, bottom: verticalSpace, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = LocationDetailController(locationData[indexPath.row])
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)

    }
    
    func goToLocation() {
        let vc = LocationDetailController(selectedLocation)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // The horizontal position of the scrollview.
        let x = scrollView.contentOffset.x
        let change = x - oldValue
        
        if change > 0 {
            locationsView.wavyView.waveIncrease()
        } else if change < 0 {
            locationsView.wavyView.waveDecrease()
        }
        
        oldValue = x
        
        calculatePageControl(scrollView)
    }
}
