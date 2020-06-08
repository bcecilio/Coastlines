//
//  LocationCell.swift
//  Coastlines
//
//  Created by Ahad Islam on 6/1/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationCell: UICollectionViewCell {
    
    enum Location: CaseIterable {
        case newYork
        case newOrleans
        case florida
        case bangladesh
    }
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "nyc"))
        iv.contentMode = .scaleToFill
        iv.alpha = 0.9
        return iv
    }()
    
    private lazy var label: UILabel = {
        let l = UILabel()
        l.text = "New York City"
        l.textColor = .white
        l.textAlignment = .right
        l.font = .preferredFont(forTextStyle: .title1)
        l.alpha = 1
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        setupViews()
        
        
    }
    
    public func configureCell(_ location: Location) {
        switch location {
        case .newYork:
            label.text = "New York"
            imageView.image = UIImage(named: "nyc")
        case .florida:
            label.text = "Florida"
            imageView.image = UIImage(named: "miami")
        case .newOrleans:
            label.text = "New Orleans"
            imageView.image = UIImage(named: "new-orleans")
        case .bangladesh:
            label.text = "Bangladesh"
            imageView.image = UIImage(named: "bangladesh")
        }
    }
    
    private func setupViews() {
        setupImageView()
        setupLabel()
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8)])
    }
}
