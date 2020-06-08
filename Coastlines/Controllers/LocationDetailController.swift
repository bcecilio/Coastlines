//
//  LocationDetailController.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/4/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

class LocationDetailController: UIViewController {
    
    private var locationView = DetailView()
    
    private let location: Location
    
    private var isStatusBarHidden = false
        
    public var showPieChart = false
    
    init(_ location: Location) {
        self.location = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool {
        return self.isStatusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override func loadView() {
        view = locationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        
        locationView.goToARButton.addTarget(self, action: #selector(goToARButtonPressed(_:)), for: .touchUpInside)
        locationView.backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        setupUI()
        
        locationView.collectionView.delegate = self
        locationView.collectionView.dataSource = self
        locationView.collectionView.isScrollEnabled = false
    }
    
    private func setupUI() {
        locationView.locationImage.image = UIImage(named: location.imageName)
        locationView.locationLabel.text = location.name
    }
    
    @objc func goToARButtonPressed(_ sender: UIButton) {
        
        print("AR Button Pressed")
        
        let arVC = ARViewController()
        present(arVC, animated: true)
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        
        print("Back Button Pressed")
        self.dismiss(animated: true)
    }
    
    private func animateRightScroll() {
        
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.locationView.collectionView.contentOffset.x += self.locationView.frame.width-8
        }, completion: nil)
        
//        UIView.animate(withDuration: 1.25, delay: 0, options: .curveEaseOut, animations: {
//            self.locationView.nameLabelLeading.constant -= self.locationView.frame.width+8
////            self.locationView.wView.start = 0.5
//            self.locationView.layoutIfNeeded()
//        }, completion: nil)
        print(locationView.collectionView.contentOffset.x.description)
    }
    
    private func animateLeftScroll() {
        
        locationView.wView.waveIncrease()
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.locationView.collectionView.contentOffset.x -= self.locationView.frame.width-8
        }, completion: nil)
        
//        UIView.animate(withDuration: 1.25, delay: 0, options: .curveEaseOut, animations: {
//            self.locationView.nameLabelLeading.constant += self.locationView.frame.width+8
////            self.locationView.wavyLeading.constant += self.locationView.frame.width+8
////            self.locationView.wView.start = 0.5
//            self.locationView.layoutIfNeeded()
//        }, completion: nil)
        print(locationView.collectionView.contentOffset.x.description)
    }
}

extension LocationDetailController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as? ContentCell, let graphCell = collectionView.dequeueReusableCell(withReuseIdentifier: "graphCell", for: indexPath) as? GraphCell, let pieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pieCell", for: indexPath) as? PieChartCell, let arCell = collectionView.dequeueReusableCell(withReuseIdentifier: "arCell", for: indexPath) as? ARCell else {
            fatalError("Failed to create cell")
        }
        
        contentCell.index = indexPath
        contentCell.cellDelegate = self
        graphCell.index = indexPath
        graphCell.cellDelegate = self
        pieCell.index = indexPath
        pieCell.cellDelegate = self
        arCell.index = indexPath
        arCell.cellDelegate = self
        
        switch indexPath.row {
            
        case 0:
            contentCell.headerLabel.text = "Did you know?"
            contentCell.contentLabel.text = location.facts.generalFacts
            contentCell.prevButton.isHidden = true
            return contentCell
        case 1:
            contentCell.headerLabel.text = "What is happening?"
            contentCell.contentLabel.text = location.facts.generalFacts
            return contentCell
        case 2:
            graphCell.location = location
            graphCell.headerLabel.text = "Sea Level Rise by 2100"
            graphCell.setSeaLevelData()
            graphCell.seaLevelSet.setCircleColor(PaletteColours.lightBlue.rawValue.convertHexToColour())
            graphCell.seaLevelSet.setColor(PaletteColours.lightBlue.rawValue.convertHexToColour())
            graphCell.seaLevelSet.fill = Fill(color: PaletteColours.lightBlue.rawValue.convertHexToColour())
            graphCell.seaLevelLineChart.animate(xAxisDuration: 2, yAxisDuration: 5, easingOption: .easeInCirc)
            return graphCell
        case 3:
            contentCell.headerLabel.text = "Where will we go?"
            contentCell.contentLabel.text = location.facts.populationFacts
            return contentCell
        case 4:
            pieCell.headerLabel.text = "Population Displacement"
            pieCell.location = location
            pieCell.setPopulationGraphData()
            pieCell.populationGraphView.isHidden = false
            return pieCell
        case 5:
            contentCell.headerLabel.text = indexPath.row.description
            contentCell.contentLabel.text = ""
            contentCell.nextButton.isHidden = true
            contentCell.prevButton.isHidden = false
            return arCell
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Implement CGSize
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 8
        let numberOfItems: CGFloat = 1
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = maxSize.height / 1.75
        return  CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 5 {
            print("AR Button Pressed")
            
            let arVC = ARViewController()
            present(arVC, animated: true)
        }
    }
}

extension LocationDetailController: PrevNextButton {
    func clickedOnPrev(index: Int, cell: Any) {
        print("clicked on previous at this \(index)")
        animateLeftScroll()
        if index == 5 {
            locationView.showARButton()
        }
    }
    
    func clickedOnNext(index: Int, cell: Any) {
        print("clicked on next at this \(index)")
        animateRightScroll()
        print(locationView.collectionView.contentOffset.x.description)
        if index == 4 {
//            locationView.goToARButton.isHidden = true
            locationView.hideARButton()
        }
    }
}
