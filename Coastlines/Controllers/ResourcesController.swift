//
//  ResourcesController.swift
//  Coastlines
//
//  Created by Brendon Cecilio on 6/15/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ResourcesController: UIViewController {
    
    private let resourceView = ResourceView()
    private var resourceCell = ResourceCell()
    
    private var resources = [
        Resources(title: "Daily Actions You Can Take.", description: "\u{2022} The number one goal? Limiting the use of fossil fuels such as oil, carbon and natural gas and replacing them with renewable and cleaner sources of energy. This includes driving and flying less, switching to a ‘green’ energy provider. Learn more.", url: "https://www.huffpost.com/entry/7-instant-ways-to-reduce-your-carbon-footprint_b_59321992e4b00573ab57a383", image: "calendar"),
        Resources(title: "Bike to Work!", description: "\u{2022} To help, we've rounded up our best tips for eco-friendly commuting, starting a carpool, commuting by bike, and much more in this guide. You'll save money, time, and reduce your carbon footprint -- and could even lose weight! Learn more.", url: "https://climatechange.ucdavis.edu/what-can-i-do/want-to-save-tons-of-greenhouse-gases-bike-it/", image: "bike"),
        Resources(title: "Considering Solar Energy.", description: "\u{2022} Renewables like wind and solar are becoming increasingly cheap across the world. The cost of utility-scale solar panels has fallen 73 percent since 2010, for example, making solar energy the cheapest source of electricity for many households in Latin America, Asia and Africa. In the UK, onshore wind and solar are competitive with gas and by 2025 will be the cheapest source of electricity generation. Learn more.", url: "https://news.energysage.com/health-environmental-benefits-of-solar-energy/#:~:text=Solar%20energy%20decreases%20greenhouse%20gas,global%20temperatures%20and%20climate%20change.", image: "solar-panel"),
        Resources(title: "Does what I eat matter?", description: "\u{2022} After fossil fuels, the food industry is one of the most important contributors to climate change. By reducing your consumption of animal protein by half you will cut your diet's carbon footprint by more than 40%. Learn more.", url: "https://www.huffpost.com/entry/moby-meat_b_5889850",image: "meat"),
        Resources(title: "Can't afford to cut down?", description: "\u{2022} If you simply can’t make every change that’s needed, consider offsetting your emissions with a trusted green project – not a ‘get out of jail free card’, but another resource in your toolbox to compensate that unavoidable flight or car trip. Learn more.", url: "https://www.ecomena.org/minimizing-carbon-footprint-of-diy-projects/", image: "money"),
        Resources(title: "Attend a rally.", description: "\u{2022} Recent climate strikes have shown that we have the people power we need to solve the climate crisis and end the age of fossil fuels. Learn more.", url: "https://globalclimatestrike.net/action/", image: "human-rights"),
        Resources(title: "Plant a Tree!", description: "Whether you live in a house or an apartment, planting some greens is a quick and easy way to reduce your carbon footprint. We all know plants absorb carbon dioxide – a beneficial relationship for humans, that we should all be seeking to nurture. Plant some bee-friendly flowers, a few trees, or a vegetable garden. Learn more.", url: "https://climate.nasa.gov/news/2927/examining-the-viability-of-planting-trees-to-help-mitigate-climate-change/", image: "seed"),
        Resources(title: "Line-Dry Your Clothes!", description: "New is not always better – the traditional method of line-drying your clothing is much better for the environment. One dryer load uses 5 times more electricity than washing – by simply line-drying your clothes, you can save 1/3 of their carbon footprint. Unfortunately, line-drying seems to be America’s least favorite way to save energy – despite the fact that running a clothes dryer is equivalent to turning on 225 light bulbs for an hour. It might be time to follow Europeans' lead, especially considering the tumble dryer is one of the top energy-consuming appliances.", url: "https://www.theguardian.com/environment/green-living-blog/2010/nov/25/carbon-footprint-load-laundry", image: "tshirt")
        ]
    
    private var selectedIndex: IndexPath = IndexPath(row: -1, section: 0)
    private var lastIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    override func loadView() {
        view = resourceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PaletteColour.offWhite.colour
        setupTableView()
    }
    
    private func setupTableView() {
        resourceView.tableView.dataSource = self
        resourceView.tableView.delegate = self
        resourceView.tableView.register(ResourceCell.self, forCellReuseIdentifier: "cell")
        resourceView.tableView.separatorStyle = .none
        resourceView.tableView.backgroundColor = UIColor.clear
    }
    
    var lastRowHeight = CGFloat()
}

extension ResourcesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ResourceCell else {
            fatalError("it no dequeue bro")
        }
        resourceCell = cell
        let data = resources[indexPath.row]
        resourceCell.configureCell(with: data)
        resourceCell.selectionStyle = .none
        resourceCell.animate()
        resourceCell.backgroundColor = PaletteColour.offWhite.colour
        return resourceCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
        if lastRowHeight == 230 {
            return 75
        }
        
        if selectedIndex == indexPath {
            return 230
        }
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath
        let downChevron = UIImage(systemName: "chevron.compact.down")
        
        guard let cell = tableView.cellForRow(at: selectedIndex) as? ResourceCell, let lastCell = tableView.cellForRow(at: lastIndex) as? ResourceCell else {
            fatalError()
        }
        
        if cell != lastCell{
            lastCell.downExpand.image = downChevron
        }
        
        lastRowHeight = cell.frame.height
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
        lastIndex = indexPath
                
    }
    
}
