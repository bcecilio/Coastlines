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
    let locations = LocationCell.Location.allCases
    let locationData = FactsData.getLocations()
    
    /// Captures the last value of the x coordinate of the collection view.
    private lazy var oldValue = locationsView.collectionView.contentOffset.x
    
    override func loadView() {
        view = locationsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationsView.collectionView.dataSource = self
        locationsView.collectionView.delegate = self
        title = "Locations"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
}

// MARK: UICollectionViewDataSource/Delegate/DelegateFlowLayout

extension LocationsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Implement items
        switch section {
//        case 0:
//            return 1
        case 0:
            return locations.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
//        case 0:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "introCell", for: indexPath) as? LocationIntroCell else {
//                print("Failed to create introCell")
//                break
//            }
//            return cell
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as? LocationCell else {
                print("Failed to create locationCell")
                break
            }
            
            cell.configureCell(locations[indexPath.row])
            return cell
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Implement CGSize
        
        let maxSize: CGSize = UIScreen.main.bounds.size
//        let spacingBetweenItems: CGFloat = 0
//        let numberOfItems: CGFloat = 1
//        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
//        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = maxSize.height / 3
        return  CGSize(width: maxSize.width, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Implement insets
        let verticalSpace = view.frame.height / 5
//        let spacingBetween: CGFloat = 8
        if section == 0 {
            return UIEdgeInsets(top: verticalSpace, left: 0, bottom: verticalSpace, right: 0)
        } else {
            return UIEdgeInsets(top: verticalSpace, left: 0, bottom: verticalSpace, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let vc = LocationDetailController(locationData[indexPath.row])
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        /// The horizontal position of the scrollview.
        let x = scrollView.contentOffset.x
        let change = x - oldValue
        
        if change > 0 {
            locationsView.wavyView.waveIncrease()
        } else if change < 0 {
            locationsView.wavyView.waveDecrease()
        }
        
        oldValue = x
    }
}
