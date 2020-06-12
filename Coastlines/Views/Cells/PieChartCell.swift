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
        label.text = ""
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.alpha = 1
        return label
    }()
    
    public lazy var populationGraphView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.backgroundColor = PaletteColour.lightBlue.colour
        pieChart.layer.cornerRadius = 5
        pieChart.clipsToBounds = true
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = false
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = false
        //        pieChart.isUserInteractionEnabled = false
        pieChart.legend.enabled = true
//        pieChart.isHidden = false
        return pieChart
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.lightBlue.colour
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        setupPrevButton()
        setupNextButton()
        setupHeaderLabel()
        setupPieChart()
//        animateLabel()
        setPopulationGraphData()
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.headerLabel.alpha = 1
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
    
    private func setupPieChart() {
        addSubview(populationGraphView)
        populationGraphView.translatesAutoresizingMaskIntoConstraints = false
//        populationGraphView.delegate = self
        
        NSLayoutConstraint.activate([
            populationGraphView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            populationGraphView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            populationGraphView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            populationGraphView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
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

extension PieChartCell: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    public func setPopulationGraphData() {
        var entries = [PieChartDataEntry]()
        guard let location = location else { return }
        
        populationGraphView.isHidden = false
        entries.append(PieChartDataEntry(value: Double(location.facts.population), label: "Population"))
        entries.append(PieChartDataEntry(value: Double(location.facts.populationDisplaced), label: "Displaced"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(hex: 0xf9f7e3)
        let c2 = NSUIColor(hex: 0xa1c5c5)
        
        dataSet.colors = [c1, c2]
        
        dataSet.drawValuesEnabled = false
        
        
        populationGraphView.data = PieChartData(dataSet: dataSet)
        populationGraphView.isUserInteractionEnabled = true
        populationGraphView.setExtraOffsets(left: 0, top: 0, right: 0, bottom: 0)
    }
}
