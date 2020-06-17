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
    
    let arView = ARView()
    
    let backButton = UIButton().previousButton()
    
    lazy var coachingOverlay = ARCoachingOverlayView()
    
    var flipScene = FlipRiseSlider.FlipScene()
    var riseSegmentScene = FlipRiseSlider.RiseSegmentScene()
    
    var occBox = ModelEntity()
    
    var newSlider = RUISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupARView()
        setupBackButton()
//        setupCoachingOverlayView()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
        loadScene()
//        setupOccBox()
        setupSlider()
        
    }
    
    private func loadScene() {
        
        FlipRiseSlider.loadFlipSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The flip scene error is..... \(error)")
            case .success(let scene):
                
                self.flipScene = scene
                
                self.arView.scene.anchors.append(scene)
//                self.coachingOverlay.isHidden = true
//                self.flipScene.addChild(self.occBox)
                self.flipScene.actions.flipModel.onAction = self.wasFlipped(_:)
            }
        }
        
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
        let (cityLight, _, _, _) = CityLights.addSpotlights()
        
        riseSegmentScene.isEnabled = true
        flipScene.isEnabled = false
        
        riseSegmentScene.addChild(cityLight)
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
    
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
                
    }
    
    @objc
    func goBack(_ sender: UIButton) {
        arView.scene.anchors.removeAll()
        self.dismiss(animated: true)
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
    
    private func setupBackButton() {
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
