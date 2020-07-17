//
//  SplashScreenView.swift
//  TestFeatureTarget
//
//  Created by Cameron Rivera on 7/16/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class SplashScreenView: UIView {
    
    public lazy var imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "splashLogo")
        iv.alpha = 1.0
        return iv
    }()
    
    public lazy var hiddenImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "splashLogo")
        iv.alpha = 0.0
        return iv
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
        setUpImageViewConstraints()
        setUpHiddenImageViewConstraints()
    }
    
    private func setUpImageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ imageView.topAnchor.constraint(equalTo: bottomAnchor), imageView.centerXAnchor.constraint(equalTo: centerXAnchor), imageView.heightAnchor.constraint(equalToConstant: 44), imageView.widthAnchor.constraint(equalToConstant: 44)])
    }
    
    private func setUpHiddenImageViewConstraints() {
        addSubview(hiddenImageView)
        hiddenImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([hiddenImageView.centerYAnchor.constraint(equalTo: centerYAnchor), hiddenImageView.centerXAnchor.constraint(equalTo: centerXAnchor), hiddenImageView.heightAnchor.constraint(equalToConstant: 44), hiddenImageView.widthAnchor.constraint(equalToConstant: 44)])
    }
    
    public func toggleImageViews() {
        imageView.alpha = 0.0
        hiddenImageView.alpha = 1.0
    }
    

}
