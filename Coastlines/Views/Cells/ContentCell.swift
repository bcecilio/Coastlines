//
//  ContentCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/4/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

protocol PrevNextButton {
    func clickedOnPrev(index: Int, cell: Any)
    func clickedOnNext(index: Int, cell: Any)
}

class ContentCell: UICollectionViewCell {
    
    var index: IndexPath?
    var cellDelegate: PrevNextButton?
    
    public lazy var nextButton: UIButton = {
        let button = UIButton()
        return button.nextButton()
    }()
    
    public lazy var prevButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        return button.previousButton()
    }()
    
    public lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .clear
        scrollview.showsVerticalScrollIndicator = false
        return scrollview
    }()
    
    public lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.alpha = 0
        return label
    }()
    
    public lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        
        
        setupScrollView()
        setupHeaderLabel()
        setupContentLabel()
        setupPrevButton()
        setupNextButton()
        animateLabel()
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.headerLabel.alpha = 1
            self.contentLabel.alpha = 1
        }, completion: nil)
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
            headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupContentLabel() {
        scrollView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60)
        ])
    }
    
    @objc func prevButtonPressed(_ sender: UIButton) {
        
        print("Prev Button Pressed")
        cellDelegate?.clickedOnPrev(index: (index?.row)!, cell: self)
        
    }
    
    @objc func nextButtonPressed(_ sender: UIButton) {
        print("next button pressed")
        cellDelegate?.clickedOnNext(index: (index?.row)!, cell: self)
    }
}
