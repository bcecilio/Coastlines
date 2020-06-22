//
//  GraphCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/5/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

protocol GraphClicked {
    func clickedOnGraph(year: Double, rise: Double)
}

class GraphCell: UICollectionViewCell {
    
    public var seaLevelSet = LineChartDataSet()
    public var location: Location?
    public var index: IndexPath?
    public var cellDelegate: PrevNextButton?
    public var graphDelegate: GraphClicked?
    
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
        label.textAlignment = .center
        label.font = Font.cooper34
        label.textColor = PaletteColour.offWhite.colour
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var seaLevelLineChart: LineChartView = {
        let lineChart = LineChartView()
        lineChart.backgroundColor = PaletteColour.offWhite.colour
        lineChart.layer.cornerRadius = 5
        lineChart.clipsToBounds = true
        lineChart.rightAxis.enabled = false
        let yAxis = lineChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        lineChart.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(5, force: false)
        yAxis.axisLineColor = PaletteColour.lightBlue.colour
        yAxis.labelTextColor = PaletteColour.lightBlue.colour
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelTextColor = PaletteColour.lightBlue.colour
        lineChart.xAxis.axisLineColor = PaletteColour.lightBlue.colour
        yAxis.drawGridLinesEnabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.setLabelCount(5, force: false)
        lineChart.legend.enabled = false
        lineChart.xAxis.avoidFirstLastClippingEnabled = true
        return lineChart
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = PaletteColour.offWhite.colour
        label.font = Font.cooper20
        label.numberOfLines = 0
        label.alpha = 1
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.lightBlue.colour
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        setupPrevButton()
        setupNextButton()
        setupHeaderLabel()
        setupSeaLevelGraph()
        setupDescriptionLabel()
        setSeaLevelData()
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
        headerLabel.text = ContentText.seaLevels
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupSeaLevelGraph() {
        addSubview(seaLevelLineChart)
        seaLevelLineChart.delegate = self
        seaLevelLineChart.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            seaLevelLineChart.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            seaLevelLineChart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            seaLevelLineChart.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            seaLevelLineChart.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "\nRise in inches by 2100"
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: seaLevelLineChart.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func prevButtonPressed(_ sender: UIButton) {
        
        print("Prev Button Pressed")
        cellDelegate?.clickedOnPrev(index: (index?.row)!, cell: self)
        
    }
    
    @objc func nextButtonPressed(_ sender: UIButton) {
        print("next button pressed")
        cellDelegate?.clickedOnNext(index: (index?.row)!, cell: self)
    }
}

extension GraphCell: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        graphDelegate?.clickedOnGraph(year: entry.x, rise: entry.y)
    }
    
    public func setSeaLevelData() {
        seaLevelSet = LineChartDataSet(entries: getSeaLevelData())
        seaLevelSet.circleRadius = 3
        seaLevelSet.drawCirclesEnabled = false
        seaLevelSet.mode = .cubicBezier
        seaLevelSet.lineWidth = 3
        seaLevelSet.setCircleColor(PaletteColour.lightBlue.colour)
        seaLevelSet.setColor(PaletteColour.lightBlue.colour)
        seaLevelSet.fill = Fill(color: PaletteColour.lightBlue.colour)
        seaLevelSet.fillAlpha = 0.6
        seaLevelSet.drawFilledEnabled = true
        seaLevelSet.drawHorizontalHighlightIndicatorEnabled = false
        seaLevelSet.drawVerticalHighlightIndicatorEnabled = false
        let data = LineChartData(dataSet: seaLevelSet)
        data.setDrawValues(false)
        seaLevelLineChart.data = data
    }
    
    public func getSeaLevelData() -> [ChartDataEntry] {
        var dataEntry: [ChartDataEntry] = []
        
        guard let location = location else { return dataEntry }
        
        for data in location.dataSet {
            let entry = ChartDataEntry(x: Double(data.year), y: data.level)
            dataEntry.append(entry)
        }
        return dataEntry
    }
}

