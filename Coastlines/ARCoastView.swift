//
//  ARCoastView.swift
//  Coastlines
//
//  Created by Ahad Islam on 5/27/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import RealityKit

class ARCoastView: UIView {
    
    private lazy var arView = ARView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        setupARView()
    }
    
    private func setupARView() {
        addSubview(arView)
        arView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arView.topAnchor.constraint(equalTo: topAnchor),
            arView.leadingAnchor.constraint(equalTo: leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: trailingAnchor),
            arView.bottomAnchor.constraint(equalTo:  bottomAnchor)])
    }

}
