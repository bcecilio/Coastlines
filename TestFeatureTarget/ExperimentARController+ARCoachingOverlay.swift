//
//  ExperimentARController+ARCoachingOverlay.swift
//  TestFeatureTarget
//
//  Created by Ahad Islam on 6/15/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import RealityKit
import ARKit

extension ExperimentARController: ARCoachingOverlayViewDelegate {
    
    func setupCoachingOverlayView() {
        arView.addSubview(coachingOverlay)
        
        coachingOverlay.session = arView.session
        
        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coachingOverlay.centerXAnchor.constraint(equalTo: arView.centerXAnchor),
            coachingOverlay.centerYAnchor.constraint(equalTo: arView.centerYAnchor),
            coachingOverlay.heightAnchor.constraint(equalTo: arView.heightAnchor),
            coachingOverlay.widthAnchor.constraint(equalTo: arView.widthAnchor)])
        
        setActivatesAutomatically()
        setGoal()
    }
    
    func setActivatesAutomatically() {
        coachingOverlay.activatesAutomatically = true
    }
    
    func setGoal() {
        coachingOverlay.goal = .horizontalPlane
    }
}
