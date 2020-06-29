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
        return label
    }()
    
    public lazy var populationGraphView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.backgroundColor = PaletteColour.lightBlue.colour
        pieChart.layer.cornerRadius = 5
        pieChart.clipsToBounds = true
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = false
        pieChart.rotationAngle = 20
        pieChart.rotationEnabled = false
        pieChart.legend.enabled = true
        return pieChart
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = PaletteColour.darkBlue.colour
        setupHeaderLabel()
        setupPieChart()
        setPopulationGraphData()
        animatePieChart()
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
            populationGraphView.heightAnchor.constraint(equalTo: populationGraphView.widthAnchor, multiplier: 0.85)
        ])
    }
    
    public func animatePieChart() {
        populationGraphView.pulsate()
    }
    
}

extension PieChartCell: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    public func setPopulationGraphData() {
        var entries = [PieChartDataEntry]()
        guard let location = location else { return }
        
        populationGraphView.isHidden = false
        populationGraphView.legend.enabled = false
        entries.append(PieChartDataEntry(value: Double(location.facts.population), label: "Population"))
        entries.append(PieChartDataEntry(value: Double(location.facts.populationDisplaced), label: "Displaced"))
        
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
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0
        pulse.damping = 5
        layer.add(pulse, forKey: nil)
    }
}
