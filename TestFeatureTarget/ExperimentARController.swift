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
import RealityUI

class ExperimentARController: UIViewController {
    
    
    
    
    //    lazy var arView = ARView(frame: view.frame)
    
    let arView = ARView()
    
    lazy var coachingOverlay = ARCoachingOverlayView()
    
    var flipScene = FlipRiseMapSlide.FlipScene()
    var riseScene = FlipRiseMapSlide.RiseScene()

    var theScene: Scene.AnchorCollection.Element?
    var occBox = ModelEntity()
    
    //var newSlider = RUISlider()//RUISlider(slider: SliderComponent(startingValue: 0.1, isContinuous: true))
    //        slider: SliderComponent(length: 0.7, startingValue: 0.1, isContinuous: true)
    //        slider: SliderComponent(length: 0.7, startingValue: 0.1, minTrackColor: .blue, maxTrackColor: .gray, thumbColor: .systemBackground, thickness: 0.1, isContinuous: true, steps: 1)
    //    ) { (slider, _) in
    //      slider.scale.x = slider.value + 0.1
    //
    //    }
    
//    public lazy var longPress: UILongPressGestureRecognizer = {
//        let lp = UILongPressGestureRecognizer()
//        return lp
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupARView()
        setupCoachingOverlayView()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
//        arView.addGestureRecognizer(longPress)
//        longPress.addTarget(self, action: #selector(registerLongPress(_:)))
        
        loadScene()
        flipScene.actions.flipModel.onAction = loadRiseScene(_:)
        //        setupSlider()
        
    }
    
    
    private func addSpotlights() -> (SpotLight, SpotLight, SpotLight) {
        let sLight = SpotLight()
        let sLight2 = SpotLight()
        let sLight3 = SpotLight()
        
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
        
        return (sLight, sLight2, sLight3)
    }
    
    private func addSpotlightComponent() -> SpotLightComponent {
        return SpotLightComponent(color: .white, intensity: 500000, innerAngleInDegrees: 10, outerAngleInDegrees: 120, attenuationRadius: 20)
    }
    
    private func loadScene() {
        
        FlipRiseMapSlide.loadFlipSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let scene):
                
                self.flipScene = scene
//                self.theScene = scene
                self.arView.scene.anchors.append(scene)
                
            }
        }
        
        FlipRiseMapSlide.loadRiseSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let scene):
                
                self.riseScene = scene
                
                let (spotlight1, spotlight2, _) = self.addSpotlights()
                scene.addChild(spotlight1)
                scene.addChild(spotlight2)
                self.arView.scene.anchors.append(scene)
                self.riseScene.isEnabled = false
                
            }
        }
        
    }
        
    private func loadRiseScene(_ entity: Entity?) {
        flipScene.isEnabled = false
        riseScene.isEnabled = true
//        arView.scene.anchors.remove(flipScene)
//        arView.scene.anchors.append(riseScene)
            
        let (spotlight1, spotlight2, _) = self.addSpotlights()
        riseScene.addChild(spotlight1)
        riseScene.addChild(spotlight2)
        
    }
    
    //    private func setupSlider() {
    //        arView.enableRealityUIGestures(.all)
    //        newSlider.position = [0,0.1,0.30]
    //        newSlider.transform.scale = [0.035,0.035,0.035]
    //        print(newSlider.value)
    //        //        newSlider.scale.x = newSlider.value + 0.1
    //
    //        newSlider = RUISlider(
    //            slider: SliderComponent(startingValue: 0.1, isContinuous: false)
    //
    //        ) { (slider, _) in
    //            //          slider.scale.x = slider.value + 0.1
    //            slider.position = [0,0.1,0.30]
    //            slider.transform.scale = [0.035,0.035,0.035]
    //            print(slider.value)
    //        }
    //
    //        //        newSlider.scale.x = newSlider.value + 0.1
    //    }
    
    var count = 0
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
        count += 1
        print(count)
        if count == 3 {
//            daScene.isEnabled = true
//            daScene.notifications.fourUp.post()
            riseScene.notifications.fourUp.post()
        }
        //        flipScene.notifications.flipBehavior.post()
//        riseScene.notifications.threeUp.post()
    }
    
//    @objc
//    private func registerLongPress(_ lp: UILongPressGestureRecognizer) {
//        //        if lp.state == .began || lp.state == .ended {
//        sliderSlid(lp.location(in: arView))
//        //        }
//    }
//
//    private func sliderSlid(_ point: CGPoint) {
//        if let slider = arView.entity(at: point) as? RUISlider {
//            print(slider.value)
//        }
//    }
    
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
