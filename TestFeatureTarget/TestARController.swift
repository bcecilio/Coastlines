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
//
//enum BoxState {
//    case appeared
//    case disappeared
//}
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
//    private let arView = TestARView()
//    private var ent = ModelEntity()
//    private var box = ModelEntity()
//    private var boxState = BoxState.appeared
//    private var horizontalAnchor = AnchorEntity()
//
//    public lazy var tap: UITapGestureRecognizer = {
//       let tap = UITapGestureRecognizer()
//        return tap
//    }()
//
//    override func loadView(){
//        view = arView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        arView.addGestureRecognizer(tap)
//        tap.addTarget(self, action: #selector(toggleBox))
//        loadEntities()
//        addAnchor()
//    }
//
//    private func addAnchor(){
//        horizontalAnchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.3,0.3])
////        ent.position = [0,0,0]
//        ent.setPosition([0,0,0], relativeTo: nil)
////        let material = SimpleMaterial(color: UIColor.blue, roughness: .float(1.0), isMetallic: false)
////        let mesh = MeshResource.generateBox(size: 1.0)
////        ent.components[ModelComponent.self] = ModelComponent(mesh: mesh, materials: [material])
//        addingOcclusion(horizontalAnchor)
//        horizontalAnchor.addChild(ent)
//        arView.scene.addAnchor(horizontalAnchor)
//    }
//
//    private func loadEntities(){
//        let assetName = "newnewLanscape3"
//        do {
//            ent = try Entity.loadModel(named: assetName)
//        } catch {
//            print(error)
//        }
//
////        _ = Entity.loadModelAsync(named: assetName)
////            .sink(receiveCompletion: { (result) in
////
////            }, receiveValue: { [weak self] (model) in
////                self?.ent = model
////            })
//    }
//
//    private func addingOcclusion(_ anchor: AnchorEntity){
//        let boxSize: Float = 1.0
//        let boxMesh = MeshResource.generateBox(size: boxSize)
//        let material = OcclusionMaterial()
//        box = ModelEntity(mesh: boxMesh, materials: [material])
//        anchor.addChild(box)
//    }
//
//    @objc
//    private func toggleBox(){
//        if boxState == .appeared {
//            horizontalAnchor.removeChild(box)
//            boxState = .disappeared
//        } else {
//            horizontalAnchor.addChild(box)
//            boxState = .appeared
//        }
//    }
//}
>>>>>>> Refactored PaletteColour enum, and centralized all onboarding text into global constants.
//
