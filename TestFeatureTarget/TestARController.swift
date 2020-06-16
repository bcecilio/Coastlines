////
////  ViewController.swift
////  TestFeatureTarget
////
////  Created by Cameron Rivera on 6/9/20.
////  Copyright © 2020 Ahad Islam. All rights reserved.
////
//
//import UIKit
//import RealityKit
//import ARKit
//import RealityUI
//
//// Must add this package to the project, make certain that it exists in both targets.
//// https://github.com/maxxfrazer/RealityUI.git
//// enum BoxState {
////    case appeared
////    case disappeared
//// }
//
<<<<<<< HEAD

import UIKit
import RealityKit
import ARKit

enum BoxState {
    case appeared
    case disappeared
}

class TestARController: UIViewController {

    private let arView = TestARView()
    private var ent = ModelEntity()
    private var box = ModelEntity()
    private var boxState = BoxState.appeared
    private var horizontalAnchor = AnchorEntity()

    public lazy var tap: UITapGestureRecognizer = {
       let tap = UITapGestureRecognizer()
        return tap
    }()
    
    override func loadView(){
        view = arView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arView.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(toggleBox))
        loadEntities()
        addAnchor()
    }
    
    private func addAnchor(){
        horizontalAnchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.3,0.3])
        arView.scene.addAnchor(horizontalAnchor)
//        ent.position = [0,0,0]
        ent.setPosition([0,0,0], relativeTo: nil)
//        addingOcclusion(horizontalAnchor)
        horizontalAnchor.addChild(ent)
    }
    
    private func loadEntities(){
        let assetName = "baseMapNYC"
        do {
            ent = try Entity.loadModel(named: assetName)
        } catch {
            print(error)
        }
        
//        _ = Entity.loadModelAsync(named: assetName)
//            .sink(receiveCompletion: { (result) in
=======
//class TestARController: UIViewController {
//
//    private let arView = ARView(frame: UIScreen.main.bounds)
//    private var yearSlider = RUISlider(length: 10, start: 0.0, steps: 0)
//    private var sliderValue: Float = 0.0 {
//        didSet{
//            print("Slider Value Changed")
//        }
//    }
////    Alternative? private let arView = ARView(frame: CGRect.zero)
////    private var ent = ModelEntity()
////    private var box = ModelEntity()
////    private var boxState = BoxState.appeared
////    private var horizontalAnchor = AnchorEntity()
//
//    public lazy var longPress: UILongPressGestureRecognizer = {
//       let lp = UILongPressGestureRecognizer()
//        return lp
//    }()
//
//    init(){
//        RealityUI.registerComponents()
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init?(coder:) was not initialized.")
//    }
//
//    override func loadView(){
//        view.addSubview(arView)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loadScene()
//        setUpSlider()
//        arView.addGestureRecognizer(longPress)
//        longPress.addTarget(self, action: #selector(registerLongPress(_:)))
////        loadEntities()
////        addAnchor()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        // Create an AR World Tracking Configuration
//        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the session
//        arView.session.run(configuration)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // Pause the session if the user leaves the view controller
//        arView.session.pause()
//    }
//
//    private func loadScene(){
//        arView.frame = view.frame
//
//        // Load the scene asynchronously
//        FlipRiseMap.loadRiseSceneAsync{ [weak self](result) in
//            switch result {
//            case .failure(let error):
//                // Got an error
//                print("Error loading Scene \(error.localizedDescription)")
//                return
//            case .success(let coastScene):
//                // Add the rcproject as an anchor in ARView
//                if let slider = self?.yearSlider {
//                    slider.isContinuous = false
//                    coastScene.addChild(slider)
//                    slider.position = [0,5,0]
//                }
//                self?.arView.scene.addAnchor(coastScene)
//            }
//        }
//    }
//
//    private func setUpSlider(){
////        yearSlider = RUISlider(length: 10, start: 0.0, steps: 0 , updateCallback: { [weak self] (slider, _) in
////            self?.sliderValue = slider.value
////        })
////        yearSlider.isContinuous = false
//    }
//
//    @objc
//    private func registerLongPress(_ lp: UILongPressGestureRecognizer) {
//        if lp.state == .began || lp.state == .ended {
//            sliderSlid(lp.location(in: arView))
//        }
//    }
//
//    private func sliderSlid(_ point: CGPoint) {
//        if let slider = arView.entity(at: point) as? RUISlider {
//            sliderValue = slider.value
//        }
//    }
//
//    private func addAnchor(){
////        horizontalAnchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.3,0.3])
////        ent.position = [0,0,0]
////        ent.setPosition([0,0,0], relativeTo: nil)
////        let material = SimpleMaterial(color: UIColor.blue, roughness: .float(1.0), isMetallic: false)
////        let mesh = MeshResource.generateBox(size: 1.0)
////        ent.components[ModelComponent.self] = ModelComponent(mesh: mesh, materials: [material])
////        addingOcclusion(horizontalAnchor)
////        horizontalAnchor.addChild(ent)
////        arView.scene.addAnchor(horizontalAnchor)
//    }
//
//    private func loadEntities(){
////        let assetName = "newnewLanscape3"
////        do {
////            ent = try Entity.loadModel(named: assetName)
////        } catch {
////            print(error)
////        }
//
////        _ = Entity.loadModelAsync(named: assetName)
////            .sink(receiveCompletion: { (result) in
////
////            }, receiveValue: { [weak self] (model) in
////                self?.ent = model
////            })
//    }
//
////    private func addingOcclusion(_ anchor: AnchorEntity){
////        let boxSize: Float = 1.0
////        let boxMesh = MeshResource.generateBox(size: boxSize)
////        let material = OcclusionMaterial()
////        box = ModelEntity(mesh: boxMesh, materials: [material])
////        anchor.addChild(box)
////    }
////
////    @objc
////    private func toggleBox(){
////        if boxState == .appeared {
////            horizontalAnchor.removeChild(box)
////            boxState = .disappeared
////        } else {
////            horizontalAnchor.addChild(box)
////            boxState = .appeared
////        }
////    }
//}
>>>>>>> Refactored PaletteColour enum, and centralized all onboarding text into global constants.
//
