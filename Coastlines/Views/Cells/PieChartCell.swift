//
//  PieChartCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/5/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

class PieChartCell: UICollectionViewCell {
    
    public var location: Location?
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "\nPeople Displaced"
        label.textAlignment = .center
        label.font = Font.cooper34
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    public lazy var populationGraphView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.backgroundColor = PaletteColour.darkBlue.colour
        pieChart.layer.cornerRadius = 5
        pieChart.clipsToBounds = true
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = false
        pieChart.rotationAngle = 20
        pieChart.rotationEnabled = false
        pieChart.legend.enabled = true
        pieChart.isUserInteractionEnabled = true
        pieChart.delegate = self
        pieChart.alpha = 0
        return pieChart
    }()
    
    public lazy var pieView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = .clear
        return view
    }()
    
    public lazy var tapChartLabel: UILabel = {
        let label = UILabel()
        label.text = "tap the chart to learn more"
        label.textAlignment = .center
        label.font = Font.boldArial18
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = PaletteColour.darkBlue.colour
        setupHeaderLabel()
        setupPieChart()
        setPopulationGraphData()
        setupPieView()
        setupTapChartLabel()
//        animatePieChart()
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupPieChart() {
        addSubview(populationGraphView)
        populationGraphView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            populationGraphView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            populationGraphView.widthAnchor.constraint(equalTo: self.widthAnchor),
            populationGraphView.heightAnchor.constraint(equalTo: populationGraphView.widthAnchor, multiplier: 0.85),
            populationGraphView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupPieView() {
        addSubview(pieView)
        pieView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pieView.centerXAnchor.constraint(equalTo: populationGraphView.centerXAnchor),
            pieView.centerYAnchor.constraint(equalTo: populationGraphView.centerYAnchor),
            pieView.widthAnchor.constraint(equalTo: populationGraphView.widthAnchor),
            pieView.heightAnchor.constraint(equalTo: populationGraphView.heightAnchor)
        ])
    }
    
    private func setupTapChartLabel() {
        addSubview(tapChartLabel)
        tapChartLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tapChartLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            tapChartLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tapChartLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    public func animatePieChart() {
        populationGraphView.pulsate()
    }
    
    public func showItems() {
        headerLabel.showItem()
        populationGraphView.showItem()
        tapChartLabel.showItem()
    }
    
    public func hideItems() {
        headerLabel.hideItem()
        populationGraphView.hideItem()
        tapChartLabel.hideItem()
    }
    
}

extension PieChartCell: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("TAAAAAAPPED")
    }
    
    public func setPopulationGraphData() {
        var entries = [PieChartDataEntry]()
        guard let location = location else { return }
        
        populationGraphView.isHidden = false
        populationGraphView.legend.enabled = true
        let percentDisplaced = Int((Double(location.facts.populationDisplaced)/Double(location.facts.population)) * 100)
        let percentNotDisplaced = 100 - percentDisplaced
        
//        legend.setCustom(colors: [UIColor.greenColor(), UIColor.blueColor(), UIColor.blackColor()], labels: ["qwe", "asd", "zxc"])
        
        let entryOne = PieChartDataEntry(value: Double(location.facts.population), label: "         Population")
        let entryTwo = PieChartDataEntry(value: Double(location.facts.populationDisplaced), label: "Displaced      ")
        
        populationGraphView.legend.textColor = PaletteColour.offWhite.colour
        
        entries.append(entryOne)
        entries.append(entryTwo)
        
        let legendOne = LegendEntry()
        legendOne.label = "\(percentNotDisplaced)%"
        legendOne.formColor = NSUIColor(hex: 0xa9bd95)
        let legendTwo = LegendEntry()
        legendTwo.label = "\(percentDisplaced)%"
        legendTwo.formColor = NSUIColor(hex: 0xe2a093)
        populationGraphView.legend.setCustom(entries: [legendOne,legendTwo])
        populationGraphView.legend.formSize = 20
        populationGraphView.legend.font = NSUIFont(name: "Arial-BoldMT", size: 16) ?? NSUIFont()
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(hex: 0xa9bd95)
        let c2 = NSUIColor(hex: 0xe2a093)
        
        dataSet.colors = [c1, c2]
        
        dataSet.drawValuesEnabled = false
        
        populationGraphView.entryLabelColor = NSUIColor(hex: 0xf9f7e3)
        populationGraphView.entryLabelFont = Font.cooper20
            
        
        dataSet.sliceSpace = 3
        populationGraphView.data = PieChartData(dataSet: dataSet)
        populationGraphView.isUserInteractionEnabled = false
        populationGraphView.setExtraOffsets(left: -16, top: -16, right: -16, bottom: -16)
        
    }
}

extension PieChartView {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.985
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0
        pulse.damping = 5
        layer.add(pulse, forKey: nil)
    }
}
