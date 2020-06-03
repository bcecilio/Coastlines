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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Implement items
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "introCell", for: indexPath) as? LocationIntroCell else {
                print("Failed to create introCell")
                break
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as? LocationCell else {
                print("Failed to create locationCell")
                break
            }
            return cell
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Implement CGSize
        return CGSize(width: view.frame.width - 24, height: view.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Implement insets
        let verticalSpace = view.frame.height / 5
        return UIEdgeInsets(top: verticalSpace, left: 16, bottom: verticalSpace, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let vc = LocationDetailVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        /// The horizontal position of the scrollview.
        let x = scrollView.contentOffset.x
        
        if x > 0 {
            locationsView.wavyView.waveIncrease()
        } else if x < 0 {
            locationsView.wavyView.waveDecrease()
        }
        
        
    }
}
