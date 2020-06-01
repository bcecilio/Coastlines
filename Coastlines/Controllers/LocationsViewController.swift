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
        view.backgroundColor = UIColor.red
    }
}

//extension LocationsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
