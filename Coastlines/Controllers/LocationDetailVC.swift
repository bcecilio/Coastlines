//
//  LocationDetailVC.swift
//  Coastlines
//
//  Created by Kelby Mittan on 5/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

class LocationDetailVC: UIViewController {
    
    private var locationView = LocationDetailView()
    
    private var detailView = DetailView()
    
    private let locations = FactsData.getLocations()
    
    private let location: Location
    
    private var isStatusBarHidden = false
    
    private var animateSLGraphCalled = false
    
    private var seaLevelSet = LineChartDataSet()
    
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
        
        view.backgroundColor = PaletteColour.lightBlue.colour
        
        locationView.goToARButton.addTarget(self, action: #selector(goToARButtonPressed(_:)), for: .touchUpInside)
        locationView.backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        locationView.scrollView.delegate = self
        locationView.seaLevelLineChart.delegate = self
        locationView.populationGraphView.delegate = self
        setupUI()
        setSeaLevelData()
        setPopulationGraphData()
        
    }
    
    private func setupUI() {
        locationView.locationImage.image = UIImage(named: location.images.one)
        locationView.locationLabel.text = location.name
        locationView.seaLevelContentLabel.text = location.facts.generalFacts
        locationView.looksLikeContentLabel.text = location.facts.seaLevelFacts
        locationView.populationContentLabel.text = location.facts.populationFacts
    }
    
    
    @objc func goToARButtonPressed(_ sender: UIBarButtonItem) {
        
        print("AR Button Pressed")
        
//        let arVC = ARViewController()
//        present(arVC, animated: true)
//        let arcV = TestARController()
//        present(arcV, animated: true)
    }
    
    @objc func backButtonPressed(_ sender: UIBarButtonItem) {
        
        print("Back Button Pressed")
        
        //        locationView.seaLevelLineChart.animate(xAxisDuration: 4)
        //        locationView.seaLevelLineChart.animate(xAxisDuration: 2, yAxisDuration: 6.5, easingOption: .easeInCirc)
//        locationView.seaLevelLineChart.animate(xAxisDuration: 10)
        self.dismiss(animated: true)
    }
}

extension LocationDetailVC: UIScrollViewDelegate {
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.7) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let y: CGFloat = scrollView.contentOffset.y
        
        print(locationView.triggerSLView2.frame.height - locationView.triggerSLView1.frame.height)
        
        if y > 60 {
            isStatusBarHidden = true
            animateStatusBar()
        } else {
            isStatusBarHidden = false
            animateStatusBar()
        }
        
        triggerGraphAnimation()
        
    }
    
    func triggerGraphAnimation() {
        let triggerHeight = locationView.triggerSLView2.frame.height - locationView.triggerSLView1.frame.height
        if triggerHeight > 15 && !animateSLGraphCalled {
            setSeaLevelData()
            seaLevelSet.setCircleColor(PaletteColour.lightBlue.colour)
            seaLevelSet.setColor(PaletteColour.lightBlue.colour)
            seaLevelSet.fill = Fill(color: PaletteColour.lightBlue.colour)
            locationView.seaLevelLineChart.animate(xAxisDuration: 2, yAxisDuration: 5, easingOption: .easeInCirc)
            animateSLGraphCalled = true
        }
    }
    
}

extension LocationDetailVC: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setSeaLevelData() {
        seaLevelSet = LineChartDataSet(entries: getSeaLevelData())
        seaLevelSet.circleRadius = 3
        seaLevelSet.drawCirclesEnabled = false
        seaLevelSet.mode = .cubicBezier
        seaLevelSet.lineWidth = 3
        seaLevelSet.setCircleColor(.clear)
        seaLevelSet.setColor(.clear)
        seaLevelSet.fill = Fill(color: .clear)
        seaLevelSet.fillAlpha = 0.6
        seaLevelSet.drawFilledEnabled = true
        seaLevelSet.drawHorizontalHighlightIndicatorEnabled = false
        seaLevelSet.drawVerticalHighlightIndicatorEnabled = false
        let data = LineChartData(dataSet: seaLevelSet)
        data.setDrawValues(false)
        locationView.seaLevelLineChart.data = data
    }
    
    func getSeaLevelData() -> [ChartDataEntry] {
        var dataEntry: [ChartDataEntry] = []
        
        for data in location.dataSet {
            let entry = ChartDataEntry(x: Double(data.year), y: data.level)
            dataEntry.append(entry)
        }
        return dataEntry
    }
    
    func setPopulationGraphData() {
        var entries = [PieChartDataEntry]()
        entries.append(PieChartDataEntry(value: Double(location.facts.population), label: "Population"))
        entries.append(PieChartDataEntry(value: Double(location.facts.populationDisplaced), label: "Displaced"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")

        let c1 = NSUIColor(hex: 0xf9f7e3)
        let c2 = NSUIColor(hex: 0xa1c5c5)
        
        dataSet.colors = [c1, c2]
        
        dataSet.drawValuesEnabled = false
        
        
        locationView.populationGraphView.data = PieChartData(dataSet: dataSet)
        locationView.populationGraphView.isUserInteractionEnabled = true
        locationView.populationGraphView.setExtraOffsets(left: 0, top: 0, right: 0, bottom: 0)
    }
}
