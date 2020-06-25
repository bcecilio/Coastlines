//
//  ContentCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/4/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

protocol TapSayMore {
    func onSayMore()
}

class ContentCell: UICollectionViewCell {
    
    var index: IndexPath?
    var cellDelegate: PrevNextButton?
    var sayMoreDelegate: TapSayMore?
    
    public lazy var nextButton: UIButton = {
        let button = UIButton()
        return button.nextButton()
    }()
    
    public lazy var prevButton: UIButton = {
        let button = UIButton()
        return button.previousButton()
    }()
    
    public lazy var sayMoreView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.alpha = 1
        return view
    }()
    
    public lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .clear
        scrollview.showsVerticalScrollIndicator = false
        scrollview.alpha = 1
        scrollview.isScrollEnabled = false
        return scrollview
    }()
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.textColor = PaletteColour.offWhite.colour
        label.font = Font.cooper34
        label.numberOfLines = 0
        label.alpha = 1
        return label
    }()
    
    public lazy var factOneLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = Font.cooper24
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        label.alpha = 1
        return label
    }()
    
    public lazy var factTwoLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = Font.cooper24
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        label.alpha = 1
        return label
    }()
    
    public lazy var sayMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("learn more", for: .normal)
        button.titleLabel?.textColor = PaletteColour.offWhite.colour
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 3
        button.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        return button
    }()
    
    public lazy var learnMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "More to learn..."
        label.textAlignment = .left
        label.textColor = PaletteColour.offWhite.colour
        label.font = Font.cooper24
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    public lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.textColor = PaletteColour.offWhite.colour
        label.font = Font.cooper20
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.darkBlue.colour
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        sayMoreButton.addTarget(self, action: #selector(sayMorePressed(_:)), for: .touchUpInside)
        
        setupScrollView()
        setupHeaderLabel()
        setupFactOneLabel()
        setupFactTwoLabel()
        setupSayMoreButton()
        setupSayMoreView()
        setupLearnMoreLabel()
        setupContentLabel()
        setupPrevButton()
        setupNextButton()
        
    }
    
    
    private func setupPrevButton() {
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            prevButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            prevButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            prevButton.widthAnchor.constraint(equalToConstant: 44),
            prevButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupNextButton() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupHeaderLabel() {
        scrollView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupFactOneLabel() {
        scrollView.addSubview(factOneLabel)
        factOneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            factOneLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0),
            factOneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            factOneLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupFactTwoLabel() {
        scrollView.addSubview(factTwoLabel)
        factTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            factTwoLabel.topAnchor.constraint(equalTo: factOneLabel.bottomAnchor, constant: -2),
            factTwoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            factTwoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupSayMoreButton() {
        scrollView.addSubview(sayMoreButton)
        sayMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sayMoreButton.topAnchor.constraint(equalTo: factTwoLabel.bottomAnchor, constant: 10),
            sayMoreButton.widthAnchor.constraint(equalToConstant: 100),
            sayMoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            sayMoreButton.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    private func setupSayMoreView() {
        scrollView.addSubview(sayMoreView)
        sayMoreView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sayMoreView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            sayMoreView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            sayMoreView.widthAnchor.constraint(equalToConstant: 1),
            sayMoreView.bottomAnchor.constraint(equalTo: sayMoreButton.bottomAnchor)
        ])
    }
    
    private func setupLearnMoreLabel() {
        scrollView.addSubview(learnMoreLabel)
        learnMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            learnMoreLabel.topAnchor.constraint(equalTo: sayMoreButton.bottomAnchor, constant: 10),
            learnMoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            learnMoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupContentLabel() {
        scrollView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: learnMoreLabel.bottomAnchor, constant: 0),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -80)
        ])
    }
    
    
    @objc func prevButtonPressed(_ sender: UIButton) {
        cellDelegate?.clickedOnPrev(index: (index?.row)!, cell: self)
    }
    
    @objc func nextButtonPressed(_ sender: UIButton) {
        cellDelegate?.clickedOnNext(index: (index?.row)!, cell: self)
    }
    
    @objc func sayMorePressed(_ sender: UIButton) {
        
        scrollView.isScrollEnabled = true
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.scrollView.contentOffset.y += self.sayMoreView.frame.height
            self.learnMoreLabel.alpha = 1
            self.contentLabel.alpha = 1
        }, completion: nil)
        
        sayMoreButton.isHidden = true
    }
    
}

