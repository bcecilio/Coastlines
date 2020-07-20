import RealityKit
import ARKit
import RealityUI

class ExperimentARController: UIViewController {
    
    var arView = ARView()
    
    let location: Location
    
    let configuration = ARWorldTrackingConfiguration()
    
    let backButton = UIButton().previousButton()
    lazy var coachingOverlay = ARCoachingOverlayView()
    
    var dropScene = DropFlipRiseNYC.DropScene()
    var flipScene = DropFlipRiseNYC.FlipScene()
    var riseSegmentScene = DropFlipRiseNYC.RiseSegmentScene()
    
    var occBox = ModelEntity()
    
    var newSlider = RUISlider()
    
    var (bParkLight, sssLight, dumboLight) = CityLights.addMarkerLights()
    
    var (cityLightOne, cityLightTwo, cityLightThree, cityLightFour, brookLight) = CityLights.addCityLights()
    
    var (redLight, brookRed) = CityLights.addDangerLights()
    
    var oldSliderVal: Float = 0.1
    
    init(_ location: Location) {
        self.location = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupARView()
        
        setupCoachingOverlayView()
        
        loadScene()
        //        setupOccBox()
        setupSlider()
        
        
//        arView.session.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupBackButton()
    }
    
    private func loadScene() {
        
        DropFlipRiseNYC.loadDropSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The flip scene error is..... \(error)")
            case .success(let scene):
                
                self.dropScene = scene
                
                self.arView.scene.anchors.append(scene)
                // self.coachingOverlay.isHidden = true
                self.coachingOverlay.setActive(false, animated: true)
                self.dropScene.actions.drop.onAction = self.wasDropped(_:)
            }
        }
        
        DropFlipRiseNYC.loadFlipSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The flip scene error is..... \(error)")
            case .success(let scene):
                
                self.flipScene = scene
                
                self.arView.scene.anchors.append(scene)
                //                self.coachingOverlay.isHidden = true
                //                self.flipScene.addChild(self.occBox)
                self.flipScene.isEnabled = false
                self.flipScene.actions.flipModel.onAction = self.wasFlipped(_:)
            }
        }
        
        DropFlipRiseNYC.loadRiseSegmentSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The seaRise error is..... \(error)")
            case .success(let scene):
                
                self.riseSegmentScene = scene
                let markerScene = self.riseSegmentScene
                self.arView.scene.anchors.append(self.riseSegmentScene)
                self.riseSegmentScene.isEnabled = false
                markerScene.twenty20?.isEnabled = true
                markerScene.twenty30?.isEnabled = false
                markerScene.twenty40?.isEnabled = false
                markerScene.twenty50?.isEnabled = false
                markerScene.twenty60?.isEnabled = false
                markerScene.twenty70?.isEnabled = false
                markerScene.twenty80?.isEnabled = false
                markerScene.twenty90?.isEnabled = false
                markerScene.twenty100?.isEnabled = false
                self.showMarkers(markerScene.bParkMarkerEntities, show: false)
                self.showMarkers(markerScene.sssMarkerEntities, show: false)
                self.showMarkers(markerScene.dumboMarkerEntities, show: false)
                markerScene.bParkImage?.isEnabled = false
                markerScene.sssImage?.isEnabled = false
                markerScene.dumboImage?.isEnabled = false
                
                self.riseSegmentScene.actions.showBPark.onAction = self.showBPark(_:)
                self.riseSegmentScene.actions.showSSS.onAction = self.showSSS(_:)
                self.riseSegmentScene.actions.showDumbo.onAction = self.showDumbo(_:)
            }
        }
    }
    
    func showBPark(_ entity: Entity?) {
        riseSegmentScene.bParkImage?.isEnabled = true
        showMarkers(riseSegmentScene.bParkMarkerEntities, show: true)
    }
    
    func showSSS(_ entity: Entity?) {
        riseSegmentScene.sssImage?.isEnabled = true
        showMarkers(riseSegmentScene.sssMarkerEntities, show: true)
    }
    
    func showDumbo(_ entity: Entity?) {
        riseSegmentScene.dumboImage?.isEnabled = true
        showMarkers(riseSegmentScene.dumboMarkerEntities, show: true)
    }
    
    private func showMarkers(_ entities: [Entity], show: Bool) {
        for entity in entities {
            entity.isEnabled = show
        }
    }
    
    public func setupOccBox() {
        let boxMesh = MeshResource.generateBox(width: 0.72, height: 0.5, depth: 0.42)
        let material = OcclusionMaterial()
        occBox = ModelEntity(mesh: boxMesh, materials: [material])
        occBox.position.y = -0.25
    }
    
    func wasDropped(_ entity: Entity?) {
        let flipImageLight = SpotLight()
        flipImageLight.position = [0,0.6,0.1]
        flipImageLight.light.attenuationRadius = 0.85
        flipImageLight.light.color = .white
        flipImageLight.light.intensity = 4000
        flipImageLight.look(at: flipScene.nycImage?.position ?? [0,0,0], from: flipImageLight.position, relativeTo: nil)
        flipScene.addChild(flipImageLight)
        flipScene.isEnabled = true
        
        dropScene.isEnabled = false
    }
    
    func wasFlipped(_ entity: Entity?) {
        
        riseSegmentScene.isEnabled = true
        flipScene.isEnabled = false
        
        riseSegmentScene.addChild(newSlider)
        
        addLightsToScene()
        addMarkerLightsToScene()
        
    }
    
    private func addLightsToScene() {
        
        redLight.light.color = .red
        redLight.light.attenuationRadius = 0
        riseSegmentScene.addChild(redLight)
        
        //        cityLightOne.light.color = .white
        //        riseSegmentScene.addChild(cityLightOne)
        
        cityLightTwo.light.color = .white
        riseSegmentScene.addChild(cityLightTwo)
        
        cityLightThree.light.color = .white
        riseSegmentScene.addChild(cityLightThree)
        
        //        cityLightFour.light.color = .green
        //        riseSegmentScene.addChild(cityLightFour)
        
        riseSegmentScene.addChild(brookLight)
        
        riseSegmentScene.addChild(brookRed)
        
    }
    
    private func addMarkerLightsToScene() {
        sssLight.look(at: riseSegmentScene.sssImage?.position ?? [0,0,0], from: sssLight.position, relativeTo: nil)
        
        riseSegmentScene.addChild(sssLight)
        
        bParkLight.look(at: riseSegmentScene.bParkImage?.position ?? [0,0,0], from: bParkLight.position, relativeTo: nil)
        
        riseSegmentScene.addChild(bParkLight)
        
        dumboLight.look(at: riseSegmentScene.dumboImage?.position ?? [0,0,0], from: dumboLight.position, relativeTo: nil)
        riseSegmentScene.addChild(dumboLight)
    }
    
    private func setupSlider() {
        arView.enableRealityUIGestures(.all)
        
        newSlider = RUISlider(slider: SliderComponent(startingValue: 0.1, isContinuous: true)
            
            
        ) { (slider, _) in
            
            let scene = self.riseSegmentScene
            
            let yearLabels = [scene.twenty20,scene.twenty30,scene.twenty40,scene.twenty50,scene.twenty60,scene.twenty70,scene.twenty80,scene.twenty90,scene.twenty100]
            
            let year = HandleYears.getYearLabel(sliderVal: slider.value, scene: scene)
            
            HandleYears.showYearLabel(labels: yearLabels, year: year)
            
            print(slider.value)
            
            self.redLight = CityLights.highlightManhattan(sliderVal: slider.value, light: self.redLight)
            
            self.cityLightTwo = CityLights.moveCenterCityLight(sliderVal: slider.value, light: self.cityLightTwo)
            
            self.cityLightThree = CityLights.moveRightCityLight(sliderVal: slider.value, light: self.cityLightThree)
            
            self.brookLight = CityLights.moveBKLight(sliderVal: slider.value, light: self.brookLight)
            
            self.brookRed = CityLights.highlightBrooklyn(sliderVal: slider.value, light: self.brookRed)
            
            
            
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
        
        newSlider.position = [0,0.1,0.28]
        newSlider.transform.scale = [0.06,0.06,0.06]
        
    }
    
    @objc
    func goBack(_ sender: UIButton) {
        arView.scene.anchors.removeAll()
//        arView.session.pause()
        let detailVC = LocationDetailController(location)
//        arView.removeFromSuperview()
        UIViewController.resetWindow(detailVC)
    }
    
    
    private func setupARView() {
        view.addSubview(arView)
        arView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
//        arView.automaticallyConfigureSession = false
//        configuration.planeDetection = [.horizontal]
//        configuration.environmentTexturing = .automatic
//
//        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
//            configuration.sceneReconstruction = .mesh
//        }
//        arView.session.run(configuration, options: .resetSceneReconstruction)
        
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

extension ExperimentARController: ARSessionObserver, ARSessionDelegate {
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        print("CAMERA TRACKING: \(camera.trackingState)")
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("")
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        print("ERROR IS: \(error.localizedDescription)")
    }
    
    func sessionShouldAttemptRelocalization(_ session: ARSession) -> Bool {
        return true
    }
}
