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
    public var index: IndexPath?
    public var cellDelegate: PrevNextButton?
    
    public lazy var nextButton: UIButton = {
        let button = UIButton()
        return button.nextButton()
    }()
    
    public lazy var prevButton: UIButton = {
        let button = UIButton()
        return button.previousButton()
    }()
    
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
        pieChart.backgroundColor = PaletteColour.darkBlue.colour
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
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        setupPrevButton()
        setupNextButton()
        setupHeaderLabel()
        setupPieChart()
        setPopulationGraphData()
    }
    
    private func setupPrevButton() {
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            prevButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            prevButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            prevButton.widthAnchor.constraint(equalToConstant: 44),
            prevButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupNextButton() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
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
//        populationGraphView.delegate = self
        
        NSLayoutConstraint.activate([
            populationGraphView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            populationGraphView.widthAnchor.constraint(equalTo: self.widthAnchor),
            populationGraphView.heightAnchor.constraint(equalTo: populationGraphView.widthAnchor, multiplier: 0.85)
        ])
    }
    
    @objc func prevButtonPressed(_ sender: UIButton) {
        cellDelegate?.clickedOnPrev(index: (index?.row)!, cell: self)
    }

    @objc func nextButtonPressed(_ sender: UIButton) {
        cellDelegate?.clickedOnNext(index: (index?.row)!, cell: self)
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
