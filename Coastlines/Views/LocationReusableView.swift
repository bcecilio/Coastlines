//
//  LocationReusableView.swift
//  Coastlines
//
//  Created by Ahad Islam on 6/1/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationReusableView: UICollectionReusableView {
    private lazy var label: UILabel = {
        let l = UILabel()
        l.text = "Swipe right to view locations"
        l.textAlignment = .right
        l.font = .preferredFont(forTextStyle: .largeTitle)
        l.numberOfLines = 2
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLabel()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
    }
    
    private func setupLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8)])
    }
}
