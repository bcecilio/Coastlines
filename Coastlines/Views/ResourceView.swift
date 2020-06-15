//
//  ResourceView.swift
//  Coastlines
//
//  Created by Brendon Cecilio on 6/15/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ResourceView: UIView {
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    public lazy var prevButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
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
        setupPrevButton()
        setupTableView()
    }
    
    private func setupPrevButton() {
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prevButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            prevButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: prevButton.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc private func goBack() {
        
        let locationVC = LocationsViewController()
        UIViewController.resetWindow(locationVC)
    }
    
}
