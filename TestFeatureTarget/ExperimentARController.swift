////
////  ExperimentARController.swift
////  TestFeatureTarget
////
////  Created by Kelby Mittan on 6/10/20.
////  Copyright © 2020 Ahad Islam. All rights reserved.
////
//
<<<<<<< HEAD
//  ExperimentARController.swift
//  TestFeatureTarget
//
//  Created by Kelby Mittan on 6/10/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import RealityKit
import ARKit
import Combine
import RealityUI

class ExperimentARController: UIViewController {
    
    
    
    
    //    lazy var arView = ARView(frame: view.frame)
    
    let arView = ARView()
    
    lazy var coachingOverlay = ARCoachingOverlayView()
    
    var flipScene = FlipRiseSlider.FlipScene()
//    var riseScene = FlipRiseSlider.RiseScene()
//    var seaRiseScene = FlipRiseSlider.SeaRiseScene()
    var riseSegmentScene = FlipRiseSlider.RiseSegmentScene()
    
    var occBox = ModelEntity()
    
    var newSlider = RUISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupARView()
        setupCoachingOverlayView()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
        loadScene()
//        setupOccBox()
        setupSlider()
        
    }
    
    private func addSpotlights() -> (SpotLight, SpotLight, SpotLight, SpotLight) {
        let redLightManh = SpotLight()
        let whiteLightOne = SpotLight()
        let redLightBrook = SpotLight()
        let whiteLightBrook = SpotLight()
        
        redLightManh.position =  [-0.2335, 0, 0.1584]
        redLightManh.light.attenuationRadius = 0.96
        redLightManh.light.color = .red
        redLightManh.light.intensity = 500000
        
        redLightManh.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-60),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        whiteLightOne.position = [-0.1261, 0.0487, -0.2044]
        whiteLightOne.light.attenuationRadius = 0.26
        whiteLightOne.light.color = .systemTeal
        whiteLightOne.light.innerAngleInDegrees = 180
        whiteLightOne.light.outerAngleInDegrees = 0
        
        redLightBrook.position = [0.1644, 0.0487, 0.2044]
        redLightBrook.light.attenuationRadius = 0.16
        redLightBrook.light.color = .green
        redLightBrook.light.outerAngleInDegrees = 135
        return (redLightManh, whiteLightOne, redLightBrook, whiteLightBrook)
    }
    
    private func loadScene() {
        
        FlipRiseSlider.loadFlipSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The flip scene error is..... \(error)")
            case .success(let scene):
                
                self.flipScene = scene
                
                self.arView.scene.anchors.append(scene)
                self.coachingOverlay.isHidden = true
                
                self.flipScene.addChild(self.occBox)
                self.flipScene.actions.flipModel.onAction = self.wasFlipped(_:)
            }
        }
        
//        FlipRiseMapSlide.loadRiseSceneAsync { [unowned self] result in
//            switch result {
//            case .failure(let error):
//                print("The rise error is..... \(error)")
//            case .success(let scene):
//
//                self.riseScene = scene
//
//                self.arView.scene.anchors.append(self.riseScene)
//                self.riseScene.isEnabled = false
//
//            }
//        }
        
//        FlipRiseMapSlide.loadSeaRiseSceneAsync { [unowned self] result in
//            switch result {
//            case .failure(let error):
//                print("The seaRise error is..... \(error)")
//            case .success(let scene):
//
//                self.seaRiseScene = scene
//
//                self.arView.scene.anchors.append(self.seaRiseScene)
//                self.seaRiseScene.isEnabled = false
//
//            }
//        }
        
        FlipRiseSlider.loadRiseSegmentSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The seaRise error is..... \(error)")
            case .success(let scene):
                
                self.riseSegmentScene = scene
                                
                self.arView.scene.anchors.append(self.riseSegmentScene)
                self.riseSegmentScene.isEnabled = false
                
            }
        }
    }
    
    public func setupOccBox() {
        let boxMesh = MeshResource.generateBox(width: 0.72, height: 0.5, depth: 0.42)
        let material = OcclusionMaterial()
        occBox = ModelEntity(mesh: boxMesh, materials: [material])
        occBox.position.y = -0.25
    }
        
    
    func wasFlipped(_ entity: Entity?) {
        print("please be flipped")
//        let (redManh, spotlight2, _, _) = self.addSpotlights()
        
        riseSegmentScene.isEnabled = true
        flipScene.isEnabled = false
        
//        riseSegmentScene.addChild(redManh)
//        riseSegmentScene.addChild(spotlight2)
        riseSegmentScene.addChild(newSlider)
    }
    
    private func setupSlider() {
        arView.enableRealityUIGestures(.all)
        
        newSlider = RUISlider( slider: SliderComponent(startingValue: 0.1, isContinuous: false)
            
            
        ) { (slider, _) in
            
            let scene = self.riseSegmentScene
            print(slider.value)
            
            if let transformOne = CompSeaLevel.riseDropOne(sliderVal: slider.value, entity: scene.riserOne) {
                scene.riserOne?.move(to: transformOne, relativeTo: scene, duration: 8)
            }
            
            if let transformTwo = CompSeaLevel.riseDropTwo(sliderVal: slider.value, entity: scene.riserTwo) {
                scene.riserTwo?.move(to: transformTwo, relativeTo: scene, duration: 8)
            }
            
            if let transformThree = CompSeaLevel.riseDropThree(sliderVal: slider.value, entity: scene.riserThree) {
                
                scene.riserThree?.move(to: transformThree, relativeTo: scene, duration: 8)
            }
            
            if let transformFour = CompSeaLevel.riseDropFour(sliderVal: slider.value, entity: scene.riserFour) {
                
                scene.riserFour?.move(to: transformFour, relativeTo: scene, duration: 8)
            }
            
            if let transformFive = CompSeaLevel.riseDropFive(sliderVal: slider.value, entity: scene.riserFive) {
                
                scene.riserFive?.move(to: transformFive, relativeTo: scene, duration: 8)
            }
            
            if let transformSix = CompSeaLevel.riseDropSix(sliderVal: slider.value, entity: scene.riserSix) {
                
                scene.riserSix?.move(to: transformSix, relativeTo: scene, duration: 8)
            }
            
            if let transformSeven = CompSeaLevel.riseDropSeven(sliderVal: slider.value, entity: scene.riserSeven) {
                
                scene.riserSeven?.move(to: transformSeven, relativeTo: scene, duration: 8)
            }
            
            slider.isEnabled = true
            
        }
        
        newSlider.position = [0,0.1,0.30]
        newSlider.transform.scale = [0.05,0.05,0.05]

    }
    
    var count = 0
    var year = 0
    
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        occBox.isEnabled = false
        count += 1
        print(count)
        
        if count == 3 {
                        
        }
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
=======
//import RealityKit
//import ARKit
//import Combine
//
//class ExperimentARController: UIViewController {
//
//    //    lazy var arView = ARView(frame: view.frame)
//
//    let arView = ARView()
//
//    lazy var coachingOverlay = ARCoachingOverlayView()
//
//    var flipScene = FlipRiseMap.FlipScene()
//    var occBox = ModelEntity()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupARView()
//        setupCoachingOverlayView()
//        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
//
//        loadScene()
//    }
//
//
//    private func addSpotlights() -> (SpotLight, SpotLight) {
//        let sLight = SpotLight()
//        let sLight2 = SpotLight()
//        let sLight3 = SpotLight()
//
//        //        let boxMesh = MeshResource.generateBox(width: 72, height: 5, depth: 42)
//        //        let material = SimpleMaterial()
//        //        occBox = ModelEntity(mesh: boxMesh, materials: [material])
//        //        occBox.position.y = 0.5
//        sLight.position =  [-0.2335, 0, 0.1584]
//        sLight.light.attenuationRadius = 0.96
//        sLight.light.color = .red
//        sLight.light.intensity = 500000
//        //        sLight.light.innerAngleInDegrees = 310
//        //        sLight.light.outerAngleInDegrees = 135
//
//        sLight.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-60),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
//
//        sLight2.position = [-0.1261, 0.0487, -0.2044]
//        sLight2.light.attenuationRadius = 0.26
//        sLight2.light.color = .systemTeal
//        sLight2.light.innerAngleInDegrees = 180
//        sLight2.light.outerAngleInDegrees = 0
//        //        sLight2.transform.rotation = simd_quatf(vector: [-30,0,90])
//
//        sLight3.position = [0.1644, 0.0487, 0.2044]
//        sLight3.light.attenuationRadius = 0.16
//        sLight3.light.color = .green
//        sLight3.light.outerAngleInDegrees = 135
//
//        return (sLight, sLight3)
//    }
//
//    private func addSpotlightComponent() -> SpotLightComponent {
//        return SpotLightComponent(color: .white, intensity: 500000, innerAngleInDegrees: 10, outerAngleInDegrees: 120, attenuationRadius: 20)
//    }
//
//    private func loadScene() {
//        FlipRiseMap.loadFlipSceneAsync { [unowned self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let scene):
//
//                let (spotlight1, spotlight2) = self.addSpotlights()
//                let spotlightComp = self.addSpotlightComponent()
//
//                self.flipScene = scene
//
//                scene.addChild(spotlight1)
//                scene.addChild(spotlight2)
//                scene.components.set(spotlightComp)
//                self.arView.scene.anchors.append(scene)
//            }
//        }
//    }
//
//
//    @objc
//    func handleTap(recognizer: UITapGestureRecognizer) {
//
//        flipScene.notifications.flipBehavior.post()
//        //        let location = recognizer.location(in: arView)
//        //
//        //
//        //        let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
//        //
//        //        if let firstResult = results.first {
//        //            let anchor = ARAnchor(name: "baseMapNYC-2", transform: firstResult.worldTransform)
//        //
//        //            arView.session.add(anchor: anchor)
//        //
//        //        } else {
//        //            print("Object Placement Failed")
//        //        }
//
//
//
//    }
//
//    func placeObject(named entityName: String, for anchor: ARAnchor) {
//        let entity = try! ModelEntity.loadModel(named: "baseMapNYC-2")
//
//
//        entity.generateCollisionShapes(recursive: true)
//
//        arView.installGestures([.rotation, .translation], for: entity)
//        
//        let anchorEntity = AnchorEntity(anchor: anchor)
//
//        anchorEntity.addChild(entity)
//
//        arView.scene.addAnchor(anchorEntity)
//    }
//
//    private func setupARView() {
//        view.addSubview(arView)
//
//        arView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            arView.topAnchor.constraint(equalTo: view.topAnchor),
//            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
//    }
//}
//
//extension ExperimentARController: ARSessionDelegate {
//
//    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
//        for anchor in anchors {
//            if let anchorName = anchor.name, anchorName == "baseMapNYC-2" {
//                placeObject(named: anchorName, for: anchor)
//            }
//        }
//    }
//}
>>>>>>> Pull request ready
