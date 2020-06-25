import UIKit
import Charts
import AVFoundation

class LocationDetailController: UIViewController {
    
    private var locationView = DetailView()
    private let location: Location
    private var tableOfContentsCell = TOCCell()
    private var seaChartCell = GraphCell()
    private var augCell = ARCell()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = PaletteColour.darkBlue.colour
        
        setupUIandTargets()
        
        locationView.collectionView.delegate = self
        locationView.collectionView.dataSource = self
        
    }
    
    private func setupUIandTargets() {
        locationView.goToARButton.addTarget(self, action: #selector(goToARButtonPressed(_:)), for: .touchUpInside)
        locationView.backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)

        locationView.imageOne.image = UIImage(named: location.images.one)
        locationView.locationLabel.text = location.name
        
        locationView.collectionView.isScrollEnabled = false
    }
    
    @objc func goToARButtonPressed(_ sender: UIButton) {
        
        print("AR Button Pressed")
        
            let arVC = ExperimentARController(location)
            UIViewController.resetWindow(arVC)
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        
        let locationsVC = LocationsViewController()
        UIViewController.resetWindow(locationsVC)
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
        
        tocCell.index = indexPath ; tocCell.cellDelegate = self
        contentCell.index = indexPath ; contentCell.cellDelegate = self
        graphCell.index = indexPath ; graphCell.cellDelegate = self
        pieCell.index = indexPath ; pieCell.cellDelegate = self
        arCell.index = indexPath ; arCell.cellDelegate = self
        
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
            augCell.animateARIcon()
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
        
        if indexPath.row == 6 {
            print("AR Button Pressed")
            
            //            let arVC = ExperimentARController(location)
            //            UIViewController.resetWindow(arVC)
            
        } else if indexPath.row == 4 {
            let showAlert = GraphShowAlert.makeAlert(year: 0, rise: 0, vc: self)
            showAlert.title = FactText.nycPop1
            showAlert.message = FactText.nycPop2
            
            showAlert.setTitle(font: Font.boldArial26, color: PaletteColour.lightGreen.colour)
            
            showAlert.setMessage(font: Font.boldArial26, color: PaletteColour.lightGreen.colour)
            self.present(showAlert, animated: true, completion: nil)
        }
    }
}

extension LocationDetailController: PrevNextButton, TapContents {
    func onItem(content: Content) {
        
        scrollHelper(to: content.rawValue)
        
        if content == .seeInAR {
            locationView.hideARButton()
        }
    }
    
    private func scrollHelper(to: Int) {
        for _ in 1...to {
            scrollRightTo(time: Double(to)*0.8)
        }
    }
    
    func clickedOnPrev(index: Int, cell: Any) {
        print("clicked on previous at this \(index)")
        scrollLeftTo()
        switch index {
        case 1:
            break
        case 3:
            animateChart()
        case 6:
            locationView.showARButton()
        default:
            break
        }
    }
    
    func clickedOnNext(index: Int, cell: Any) {
        print("clicked on next at this \(index)")
        scrollRightTo()
        switch index {
        case 0:
            break
        case 1:
            animateChart()
        case 5:
            locationView.hideARButton()
            augCell.animateARIcon()
        default:
            break
        }
    }
}

extension LocationDetailController: GraphClicked {
    
    func clickedOnGraph(year: Double, rise: Double) {
        let showAlert = GraphShowAlert.makeAlert(year: year, rise: rise, vc: self)
        
        self.present(showAlert, animated: true, completion: nil)
    }
    
    
}
