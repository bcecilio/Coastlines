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
        coachingOverlay.session = arView.session
        setUpCoachingOverlayConstraints()
        coachingOverlay.delegate = self
        coachingOverlay.setActive(true,animated: true)
//        setActivatesAutomatically()
        setGoal()
    }
    
    private func setActivatesAutomatically() {
        coachingOverlay.activatesAutomatically = true
    }
    
    private func setGoal() {
        coachingOverlay.goal = .horizontalPlane
    }
    
    private func setUpCoachingOverlayConstraints(){
        arView.addSubview(coachingOverlay)
        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coachingOverlay.centerXAnchor.constraint(equalTo: arView.centerXAnchor),
            coachingOverlay.centerYAnchor.constraint(equalTo: arView.centerYAnchor),
            coachingOverlay.heightAnchor.constraint(equalTo: arView.heightAnchor),
            coachingOverlay.widthAnchor.constraint(equalTo: arView.widthAnchor)])
    }
    
    func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingOverlayView.isHidden = false
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingOverlayView.isHidden = true
    }
}
