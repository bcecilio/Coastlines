//
//  GraphCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/5/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

class GraphCell: UICollectionViewCell {
    
    public var seaLevelSet = LineChartDataSet()
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
        label.text = ""
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.alpha = 0
        return label
    }()
    
    public lazy var seaLevelLineChart: LineChartView = {
        let lineChart = LineChartView()
        lineChart.backgroundColor = PaletteColours.offWhite.rawValue.convertHexToColour()
        lineChart.layer.cornerRadius = 5
        lineChart.clipsToBounds = true
        lineChart.rightAxis.enabled = false
        let yAxis = lineChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        lineChart.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(5, force: false)
        yAxis.axisLineColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        yAxis.labelTextColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelTextColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        lineChart.xAxis.axisLineColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        yAxis.drawGridLinesEnabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.setLabelCount(5, force: false)
        lineChart.legend.enabled = false
        lineChart.xAxis.avoidFirstLastClippingEnabled = true
        return lineChart
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColours.lightBlue.rawValue.convertHexToColour()
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        setupPrevButton()
        setupNextButton()
        setupHeaderLabel()
        setupSeaLevelGraph()
        animateLabel()
        setSeaLevelData()
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.headerLabel.alpha = 1
            self.seaLevelLineChart.alpha = 1
        }, completion: nil)
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
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
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
            seaLevelLineChart.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
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
        print(entry)
    }
    
    public func setSeaLevelData() {
        seaLevelSet = LineChartDataSet(entries: getSeaLevelData())
        seaLevelSet.circleRadius = 3
        seaLevelSet.drawCirclesEnabled = false
        seaLevelSet.mode = .cubicBezier
        seaLevelSet.lineWidth = 3
        seaLevelSet.setCircleColor(PaletteColours.lightBlue.rawValue.convertHexToColour())
        seaLevelSet.setColor(PaletteColours.lightBlue.rawValue.convertHexToColour())
        seaLevelSet.fill = Fill(color: PaletteColours.lightBlue.rawValue.convertHexToColour())
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

