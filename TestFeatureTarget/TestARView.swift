//
//  TestARView.swift
//  TestFeatureTarget
//
//  Created by Cameron Rivera on 6/9/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import ARKit
import RealityKit

class TestARView: ARView {
    
    override init(frame frameRect: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool) {
        super.init(frame: UIScreen.main.bounds, cameraMode: .ar, automaticallyConfigureSession: true)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    @objc required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
}
