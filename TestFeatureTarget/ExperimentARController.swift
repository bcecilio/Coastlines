//
//  ExperimentARController.swift
//  TestFeatureTarget
//
//  Created by Kelby Mittan on 6/10/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import RealityKit
import ARKit
import Combine

class ExperimentARController: UIViewController {
    
//    lazy var arView = ARView(frame: view.frame)
    
    let arView = ARView()
    
    lazy var coachingOverlay = ARCoachingOverlayView()
    
    var flipScene = FlipRiseMap.FlipScene()
    var occBox = ModelEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupARView()
        setupCoachingOverlayView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        arView.session.delegate = self
//
//        setupARView()
//
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
//        let anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.2])
//
//        arView.scene.addAnchor(anchor)
        
        let sLight = SpotLight()
        let sLight2 = SpotLight()
        let sLight3 = SpotLight()
        
        let testSlight = SpotLightComponent(color: .white, intensity: 500000, innerAngleInDegrees: 10, outerAngleInDegrees: 120, attenuationRadius: 20)
        
//        let boxMesh = MeshResource.generateBox(width: 72, height: 5, depth: 42)
//        let material = SimpleMaterial()
//        occBox = ModelEntity(mesh: boxMesh, materials: [material])
//        occBox.position.y = 0.5
        sLight.position =  [-0.2335, 0, 0.1584]
        sLight.light.attenuationRadius = 0.96
        sLight.light.color = .red
        sLight.light.intensity = 500000
//        sLight.light.innerAngleInDegrees = 310
//        sLight.light.outerAngleInDegrees = 135
        
        sLight.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-60),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        sLight2.position = [-0.1261, 0.0487, -0.2044]
        sLight2.light.attenuationRadius = 0.26
        sLight2.light.color = .systemTeal
        sLight2.light.innerAngleInDegrees = 180
        sLight2.light.outerAngleInDegrees = 0
//        sLight2.transform.rotation = simd_quatf(vector: [-30,0,90])
        
        sLight3.position = [0.1644, 0.0487, 0.2044]
        sLight3.light.attenuationRadius = 0.16
        sLight3.light.color = .green
        sLight3.light.outerAngleInDegrees = 135
//        sLight3.transform.rotation = simd_quatf(vector: [-30,0,90])
        
        
        do {
            flipScene = try FlipRiseMap.loadFlipScene()
            
            arView.scene.anchors.append(flipScene)
//            flipScene.addChild(occBox)
            flipScene.addChild(sLight)
//            flipScene.addChild(sLight2)
            flipScene.addChild(sLight3)
            
            flipScene.components.set(testSlight)
            
        } catch {
            print("error: \(error)")
        }
        
    }
    
    private func loadScene() {
        FlipRiseMap.loadFlipSceneAsync { result in
            switch result {
                
            }
        }
    }
    
    
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        flipScene.notifications.flipBehavior.post()
//        let location = recognizer.location(in: arView)
//
//
//        let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
//
//        if let firstResult = results.first {
//            let anchor = ARAnchor(name: "baseMapNYC-2", transform: firstResult.worldTransform)
//
//            arView.session.add(anchor: anchor)
//
//        } else {
//            print("Object Placement Failed")
//        }
        
        
        
    }
    
    func placeObject(named entityName: String, for anchor: ARAnchor) {
        let entity = try! ModelEntity.loadModel(named: "baseMapNYC-2")


        entity.generateCollisionShapes(recursive: true)

        arView.installGestures([.rotation, .translation], for: entity)

        let anchorEntity = AnchorEntity(anchor: anchor)

        anchorEntity.addChild(entity)

        arView.scene.addAnchor(anchorEntity)
    }
    
    private func setupARView() {
        view.addSubview(arView)
        
        arView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

extension ExperimentARController: ARSessionDelegate {

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            if let anchorName = anchor.name, anchorName == "baseMapNYC-2" {
                placeObject(named: anchorName, for: anchor)
            }
        }
    }
}
