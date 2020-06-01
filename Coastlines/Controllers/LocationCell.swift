//
//  LocationCell.swift
//  Coastlines
//
//  Created by Ahad Islam on 6/1/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "person.fill"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var label: UILabel = {
        let l = UILabel()
        l.text = "New York City"
        l.textColor = .lightText
        l.textAlignment = .right
        l.font = .preferredFont(forTextStyle: .headline)
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        
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
