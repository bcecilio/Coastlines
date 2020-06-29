import UIKit
import Charts
import AVFoundation

class LocationDetailController: UIViewController {
    
    private var locationView = DetailView()
    private let location: Location
    private var tableOfContentsCell = TOCCell()
    private var seaChartCell = GraphCell()
    private var augCell = ARCell()
    private var buttonTag = 0
    private var selection = Selection(selected: "")
    private var comingSoonAlert = UIAlertController()
    
    init(_ location: Location) {
        self.location = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = locationView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = PaletteColour.darkBlue.colour
        
        setupUIandTargets()
        
        locationView.collectionView.delegate = self
        locationView.collectionView.dataSource = self
        
        showHideButtons()
        
    }
    
    private func setupUIandTargets() {
        locationView.goToARButton.addTarget(self, action: #selector(goToARButtonPressed(_:)), for: .touchUpInside)
        locationView.backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        locationView.infoButton.addTarget(self, action: #selector(infoButtonPressed(_:)), for: .touchUpInside)
        locationView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        locationView.prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        
        locationView.imageOne.image = UIImage(named: location.images.one)
        locationView.locationLabel.text = location.name
        
        locationView.collectionView.isScrollEnabled = false
        
//        makeComingSoonAlert()
    }
    
    private func makeComingSoonAlert() {
        comingSoonAlert = GraphShowAlert.makeAlert(year: 0, rise: 0, vc: self)
        
        comingSoonAlert.title = "\n\nComing Soon!!!"
        comingSoonAlert.message = "\n\nAn Augmented Reality Experience for \(location.name) is on its way"
        
        comingSoonAlert.setTitle(font: Font.boldArial26, color: PaletteColour.lightBlue.colour)
        comingSoonAlert.setMessage(font: Font.boldArial24, color: PaletteColour.lightBlue.colour)
    }
    
    @objc func goToARButtonPressed(_ sender: UIButton) {
        
        let selection = Selection(selected: location.name)
        if selection != .newYork {
            makeComingSoonAlert()
            present(comingSoonAlert, animated: true, completion: nil)
        } else {
            print("AR Pressed")
            //            let arVC = ExperimentARController(location)
            //            UIViewController.resetWindow(arVC)
        }
    
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
    }
    
    @objc func infoButtonPressed(_ sender: UIButton) {
        
        let resourcesVC = ResourcesController()
        UIViewController.resetWindow(resourcesVC)
    }
    
    @objc func nextButtonPressed(_ sender: UIButton) {
        scrollRightTo()
        buttonTag += 1
        showHideButtons()
        print(buttonTag)
    }
    
    @objc func prevButtonPressed(_ sender: UIButton) {
        scrollLeftTo()
        buttonTag -= 1
        showHideButtons()
        print(buttonTag)
    }
    
    private func showHideButtons() {
        switch buttonTag {
        case 0:
            locationView.hidePrev()
        case 2:
            animateChart()
        case 5:
            locationView.showPrev()
            locationView.showNext()
            locationView.showARButton()
        case 6:
            locationView.hideNext()
            locationView.showPrev()
            locationView.hideARButton()
            augCell.arIconAnimation.play()
            augCell.arIconAnimation.loopMode = .loop
        default:
            locationView.showPrev()
        }
    }
    
    private func scrollRightTo(time: Double = 1.0) {
        
        UIView.animate(withDuration: time*(1), delay: 0, options: .curveEaseOut, animations: {
            self.locationView.collectionView.contentOffset.x += self.locationView.frame.width-5.5
            self.locationView.nameLabelLeading.constant -= self.locationView.frame.width+8
            self.locationView.wavyLeading.constant -= self.locationView.frame.width
            self.locationView.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    private func scrollLeftTo() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.locationView.collectionView.contentOffset.x -= self.locationView.frame.width-5.5
            self.locationView.nameLabelLeading.constant += self.locationView.frame.width+8
            self.locationView.wavyLeading.constant += self.locationView.frame.width
            self.locationView.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func animateChart() {
        seaChartCell.seaLevelLineChart.animate(xAxisDuration: 2, yAxisDuration: 3, easingOption: .easeInCirc)
    }
    
    private func setSeaLevelChart() {
        seaChartCell.location = location
        seaChartCell.setSeaLevelData()
        seaChartCell.seaLevelSet.setCircleColor(PaletteColour.lightBlue.colour)
        seaChartCell.seaLevelSet.setColor(PaletteColour.lightBlue.colour)
        seaChartCell.seaLevelSet.fill = Fill(color: PaletteColour.lightBlue.colour)
    }
    
}

extension LocationDetailController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let tocCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tocCell", for: indexPath) as? TOCCell, let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as? ContentCell, let graphCell = collectionView.dequeueReusableCell(withReuseIdentifier: "graphCell", for: indexPath) as? GraphCell, let pieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pieCell", for: indexPath) as? PieChartCell, let arCell = collectionView.dequeueReusableCell(withReuseIdentifier: "arCell", for: indexPath) as? ARCell else {
            fatalError("Failed to create cells")
        }
        
        switch indexPath.row {
            
        case 0:
            tableOfContentsCell = tocCell
            tableOfContentsCell.contentDelegate = self
            return tableOfContentsCell
        case 1:
            contentCell.headerLabel.text = ContentText.didYouKnow
            contentCell.headerLabel.addAccessibility(.none, ContentText.didYouKnow, nil, nil)
            contentCell.factOneLabel.text = location.facts.quickFact1
            contentCell.factOneLabel.addAccessibility(.none, location.facts.quickFact1, nil, nil)
            contentCell.factTwoLabel.text = location.facts.quickFact2
            contentCell.factTwoLabel.addAccessibility(.none, location.facts.quickFact2, nil, nil)
            contentCell.contentLabel.text = location.facts.generalFacts
            contentCell.contentLabel.addAccessibility(.none, location.facts.generalFacts, nil, nil)
            return contentCell
        case 2:
            seaChartCell = graphCell
            seaChartCell.graphDelegate = self
            setSeaLevelChart()
            return seaChartCell
        case 3:
            contentCell.headerLabel.text = ContentText.whatsHappening
            contentCell.headerLabel.addAccessibility(.none, ContentText.whatsHappening, nil, nil)
            contentCell.factOneLabel.text = location.facts.quickFact3
            contentCell.factOneLabel.addAccessibility(.none, location.facts.quickFact3, nil, nil)
            contentCell.factTwoLabel.text = location.facts.quickFact4
            contentCell.factTwoLabel.addAccessibility(.none, location.facts.quickFact4, nil, nil)
            contentCell.contentLabel.text = location.facts.seaLevelFacts
            contentCell.contentLabel.addAccessibility(.none, location.facts.seaLevelFacts, nil, nil)
            return contentCell
        case 4:
            pieCell.location = location
            pieCell.setPopulationGraphData()
            return pieCell
        case 5:
            contentCell.headerLabel.text = ContentText.whereWillWeGo
            contentCell.headerLabel.addAccessibility(.none, ContentText.whereWillWeGo, nil, nil)
            contentCell.factOneLabel.text = location.facts.quickFact5
            contentCell.factOneLabel.addAccessibility(.none, location.facts.quickFact5, nil, nil)
            contentCell.factTwoLabel.text = location.facts.quickFact6
            contentCell.factTwoLabel.addAccessibility(.none, location.facts.quickFact6, nil, nil)
            contentCell.contentLabel.text = location.facts.populationFacts
            contentCell.contentLabel.addAccessibility(.none, location.facts.populationFacts, nil, nil)
            return contentCell
        case 6:
            augCell = arCell
//            augCell.arIconAnimation.play()
//            augCell.arIconAnimation.loopMode = .loop
            return augCell
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 8
        let numberOfItems: CGFloat = 1
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = locationView.collectionView.frame.height /// 1.5
        return  CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selection = Selection(selected: location.name)
        
        if indexPath.row == 6 {
            if selection != .newYork {
                makeComingSoonAlert()
                present(comingSoonAlert, animated: true, completion: nil)
            } else {
                //            let arVC = ExperimentARController(location)
                //            UIViewController.resetWindow(arVC)
            }
            
        } else if indexPath.row == 4 {
            
            let (fact1,fact2) = FactText.getFact(selection)
            let showAlert = GraphShowAlert.makeAlert(year: 0, rise: 0, vc: self)
            
            showAlert.title = fact1
            showAlert.message = fact2
            
            showAlert.setTitle(font: Font.boldArial26, color: PaletteColour.lightBlue.colour)
            
            showAlert.setMessage(font: Font.boldArial26, color: PaletteColour.lightBlue.colour)
            self.present(showAlert, animated: true, completion: nil)
        }
    }
}

extension LocationDetailController: TapContents {
    func onItem(content: Content) {
        
        scrollHelper(to: content.rawValue)
        buttonTag = content.rawValue
        
        locationView.showPrev(delay: TimeInterval(content.rawValue)*0.5)
        
        if content == .seeInAR {
            locationView.hideARButton()
            locationView.hideNext()
            augCell.arIconAnimation.play()
            augCell.arIconAnimation.loopMode = .loop
        }
    }
    
    private func scrollHelper(to: Int) {
        for _ in 1...to {
            scrollRightTo(time: Double(to)*0.8)
        }
    }
}

extension LocationDetailController: GraphClicked {
    
    func clickedOnGraph(year: Double, rise: Double) {
        let showAlert = GraphShowAlert.makeAlert(year: year, rise: rise, vc: self)
        
        self.present(showAlert, animated: true, completion: nil)
    }
    
}
