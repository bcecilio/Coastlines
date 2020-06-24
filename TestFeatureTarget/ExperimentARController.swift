import RealityKit
import ARKit
import Combine
import RealityUI

class ExperimentARController: UIViewController {
    
    let arView = ARView()
    
    let location: Location
    
    let backButton = UIButton().previousButton()
    
    lazy var coachingOverlay = ARCoachingOverlayView()
    
    
    var dropScene = DropFlipRiseNYC.DropScene()
    var orbitFlipScene = DropFlipRiseNYC.FlipScene()
    var riseSegmentScene = DropFlipRiseNYC.RiseSegmentScene()
    
    var occBox = ModelEntity()
    
    var newSlider = RUISlider()
    
    var (_, _, brook, redLight) = CityLights.addSpotlights()
    
    var (cityLightOne, cityLightTwo, cityLightThree, cityLightFour) = CityLights.addCityLights()
    
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
        //        setupBackButton()
        setupCoachingOverlayView()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
        loadScene()
        //        setupOccBox()
        setupSlider()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupBackButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        arView.session.pause()
        
    }
    
    private func loadScene() {
        
        DropFlipRiseNYC.loadDropSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The flip scene error is..... \(error)")
            case .success(let scene):
                
                self.dropScene = scene
                
                self.arView.scene.anchors.append(scene)
                //                self.coachingOverlay.isHidden = true
                self.dropScene.actions.drop.onAction = self.wasDropped(_:)
            }
        }
        
        DropFlipRiseNYC.loadFlipSceneAsync { [unowned self] result in
            switch result {
            case .failure(let error):
                print("The flip scene error is..... \(error)")
            case .success(let scene):
                
                self.orbitFlipScene = scene
                
                self.arView.scene.anchors.append(scene)
                //                self.coachingOverlay.isHidden = true
                //                self.flipScene.addChild(self.occBox)
                self.orbitFlipScene.isEnabled = false
                self.orbitFlipScene.actions.flipModel.onAction = self.wasFlipped(_:)
            }
        }
        
        DropFlipRiseNYC.loadRiseSegmentSceneAsync { [unowned self] result in
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
    
    func wasDropped(_ entity: Entity?) {
        print("please be DROPPED")
        
        orbitFlipScene.isEnabled = true
        dropScene.isEnabled = false
    }
    
    func wasFlipped(_ entity: Entity?) {
        print("please be flipped")
        
        
        let blue = PaletteColour.lightBlue.colour
        
        riseSegmentScene.isEnabled = true
        orbitFlipScene.isEnabled = false
        
        //        riseSegmentScene.addChild(cityLight)
        //        redLight.light.color = .red
        //        riseSegmentScene.addChild(redLight)
        //
        //        cityLightOne.light.color = blue
        //        riseSegmentScene.addChild(cityLightOne)
        
        //        cityLightTwo.light.color = .green
        riseSegmentScene.addChild(cityLightTwo)
        
        cityLightThree.light.color = blue
        riseSegmentScene.addChild(cityLightThree)
        //
        //        cityLightFour.light.color = blue
        //        riseSegmentScene.addChild(cityLightFour)
        //
        //        brook.light.color = blue
        //        riseSegmentScene.addChild(brook)
        
        riseSegmentScene.addChild(newSlider)
    }
    
    private func setupSlider() {
        arView.enableRealityUIGestures(.all)
        
        newSlider = RUISlider( slider: SliderComponent(startingValue: 0.1, isContinuous: false)
            
            
        ) { (slider, _) in
            
            let scene = self.riseSegmentScene
            
            print("slider")
            print(slider.value)
            
            print("\nOld Value")
            print(self.oldSliderVal)
            
            
            
            self.cityLightTwo = CityLights.moveCenterCityLight(sliderVal: slider.value, light: self.cityLightTwo, oldVal: self.oldSliderVal)
            
                
            self.cityLightThree = CityLights.moveRightCityLight(sliderVal: slider.value, light: self.cityLightThree)
//            if slider.value > 0.5 {
//                self.redLight.light.color = .red
//                self.redLight.light.intensity = 100000
//                self.brook.light.color = .red
//            } else if slider.value <= 0.5 {
//                self.redLight.light.intensity = 800
//                self.redLight.light.color = .white
//                self.brook.light.color = .white
//            }
            
//            if slider.value > 0.5 {
//                let moveTo = float4x4.makeTranslation(x: 0, 0, 0)
//
//                self.cityLightTwo.move(to: moveTo, relativeTo: scene, duration: 8)
//                //                self.cityLightTwo.position = [-0.2035, 0, 0.1084]
//            }
            
            //            let angle = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
            //
            
            
            //            if let lightTransform = CityLights.movelights(sliderVal: slider.value, light: self.cityLightTwo) {
            ////                self.cityLightTwo.transform.rotation = angle
            //                self.cityLightTwo.move(to: lightTransform, relativeTo: scene, duration: 2)
            //
            //            }
            
            
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
        let detailVC = LocationDetailController(location)
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
