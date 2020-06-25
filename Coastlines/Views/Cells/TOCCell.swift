//
//  TOCCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/19/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

protocol TapContents {
    func onItem(content: Content)
}

enum Content: Int {
    case didYouKnow = 1
    case seaLevels = 2
    case whatsHappening = 3
    case popDisplaced = 4
    case whereWillWeGo = 5
    case seeInAR = 6
    
    init(selected: String) {
        switch selected {
        case "didYouKnow":
            self = .didYouKnow
        case "whatsHappening":
            self = .whatsHappening
        case "seaLevels":
            self = .seaLevels
        case "whereWillWeGo":
            self = .whereWillWeGo
        case "popDisplaced":
            self = .popDisplaced
        default:
            self = .seeInAR
        }
    }
}

class TOCCell: UICollectionViewCell {

    var contentDelegate: TapContents?
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = PaletteColour.offWhite.colour
        label.textAlignment = .left
//        label.font = .preferredFont(forTextStyle: .title1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 1
        label.alpha = 1
        return label
    }()
    
    public lazy var stackView: UIStackView = {
        let sView = UIStackView()
        sView.backgroundColor = .green
        sView.axis = .vertical
        sView.distribution = .fillEqually
        sView.spacing = 12
        return sView
    }()
    
    public lazy var didYouKnowItem: UIView = {
        var view = UIView()
        view = view.labelWithImage(text: "Did you know?", image: "coast")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOne(_:)))
        tap.accessibilityLabel = "didYouKnow"
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.addAccessibility(.button, "Did you know?", nil, "Shows information about why coasts are important at the current location.")
        return view
    }()
    
    public lazy var seaLevelFactsItem: UIView = {
        var view = UIView()
        view = view.labelWithImage(text: "What's happening?", image: "seaArrow")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOne(_:)))
        tap.accessibilityLabel = "whatsHappening"
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.addAccessibility(.button, "What's happening?", nil, "Shows information explaining how the sea level will rise at the current location.")
        return view
    }()
    
    public lazy var seaLevelGraphItem: UIView = {
        var view = UIView()
        view = view.labelWithImage(text: "Expected sea levels", image: "lineIcon")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOne(_:)))
        tap.accessibilityLabel = "seaLevels"
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.addAccessibility(.button, "Expected sea levels", nil, "Shows a line graph displaying sea levels from the year 2020 to 2100.")
        return view
    }()
    
    public lazy var popFactsItem: UIView = {
        var view = UIView()
        view = view.labelWithImage(text: "Where will we go?", image: "population")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOne(_:)))
        tap.accessibilityLabel = "whereWillWeGo"
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.addAccessibility(.button, "Where will we go?", nil, "Shows information about how rising sea levels will affect the current location.")
        return view
    }()
    
    public lazy var pieChartItem: UIView = {
        var view = UIView()
        view = view.labelWithImage(text: "Population displacement", image: "pie-chart")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOne(_:)))
        tap.accessibilityLabel = "popDisplaced"
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.addAccessibility(.button, "Population Displacement", nil, "Shows a pie chart displaying potential population displacement for the current location.")
        return view
    }()
    
    public lazy var arItem: UIView = {
        var view = UIView()
        view = view.labelWithImage(text: "See in AR", image: "aRIcon")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOne(_:)))
        tap.accessibilityLabel = "seeInAR"
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.addAccessibility(.button, "See in AR", nil, "Displays a page that bring you to an AR experience if tapped.")
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        backgroundColor = PaletteColour.lightBlue.colour
        setupHeaderLabel()
        configStackView()
        
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func configStackView() {
        self.addSubview(stackView)
        addSVItems()
        stackViewConstraints()
    }
    
    private func addSVItems() {
        stackView.addArrangedSubview(didYouKnowItem)
        stackView.addArrangedSubview(seaLevelGraphItem)
        stackView.addArrangedSubview(seaLevelFactsItem)
        stackView.addArrangedSubview(pieChartItem)
        stackView.addArrangedSubview(popFactsItem)
        stackView.addArrangedSubview(arItem)
    }
    
    private func stackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70)
        ])
    }
    
    @objc
    func handleTapOne(_ sender: UIView) {
        
        guard let id = sender.accessibilityLabel else { return }
        let content = Content(selected: id)
        
        print(content)
        
        contentDelegate?.onItem(content: content)
    }
}

extension UIView {
    
    func labelWithImage(text: String, image: String) -> UIView {
        let view = UIView()
        let label = UILabel()
        let iv = UIImageView()
        iv.image = UIImage(named: image)
        label.text = "\u{2022} \(text)"
        
        view.backgroundColor = .clear
        view.layer.borderWidth = 3
        view.layer.borderColor = PaletteColour.offWhite.colour.cgColor
        view.layer.cornerRadius = 4
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
        label.backgroundColor = .clear
//        label.font = .preferredFont(forTextStyle: .title2)
        label.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        label.adjustsFontForContentSizeCategory = false
        label.textColor = PaletteColour.offWhite.colour
        label.alpha = 0
        
        iv.alpha = 0
        view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iv.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            iv.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 0),
            iv.widthAnchor.constraint(equalToConstant: 38),
            iv.heightAnchor.constraint(equalToConstant: 38)
        ])
        iv.image = UIImage(named: image)
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            label.alpha = 1
            iv.alpha = 1
        }, completion: nil)
        label.trailingAnchor.constraint(equalTo: iv.leadingAnchor, constant: -8).isActive = true
        
        return view
    }
}
