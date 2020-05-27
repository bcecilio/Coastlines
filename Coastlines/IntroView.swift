//
//  IntroView.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class IntroView: UIView {
    
    public lazy var welcomeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Begin", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    public lazy var welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Coastlines"
        label.textColor = UIColor.systemTeal
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()

    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpWelcomeLabelConstraints()
        setUpWelcomeButtonConstaints()
    }
    
    private func setUpWelcomeLabelConstraints(){
        addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30), welcomeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), welcomeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), welcomeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)])
    }
    
    private func setUpWelcomeButtonConstaints(){
        addSubview(welcomeButton)
        welcomeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([welcomeButton.centerXAnchor.constraint(equalTo: centerXAnchor), welcomeButton.centerYAnchor.constraint(equalTo: centerYAnchor), welcomeButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15), welcomeButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)])
    }

}
