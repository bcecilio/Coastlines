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
        Resources(title: "Bike to Work!", description: "\u{2022} To help, we've rounded up our best tips for eco-friendly commuting, starting a carpool, commuting by bike, and much more in this guide. You'll save money, time, and reduce your carbon footprint -- and could even lose weight!"),
        Resources(title: "Daily Actions You Can Take.", description: "\u{2022} The number one goal? Limiting the use of fossil fuels such as oil, carbon and natural gas and replacing them with renewable and cleaner sources of energy. This includes driving and flying less, switching to a ‘green’ energy provider."),
        Resources(title: "Considering Solar Energy.", description: "\u{2022} Renewables like wind and solar are becoming increasingly cheap across the world. The cost of utility-scale solar panels has fallen 73 percent since 2010, for example, making solar energy the cheapest source of electricity for many households in Latin America, Asia and Africa. In the UK, onshore wind and solar are competitive with gas and by 2025 will be the cheapest source of electricity generation."),
        Resources(title: "Can my diet make a difference?", description: "\u{2022} After fossil fuels, the food industry is one of the most important contributors to climate change. By reducing your consumption of animal protein by half you will cut your diet's carbon footprint by more than 40%."),
        Resources(title: "Can't afford to cut down?", description: "\u{2022} If you simply can’t make every change that’s needed, consider offsetting your emissions with a trusted green project – not a ‘get out of jail free card’, but another resource in your toolbox to compensate that unavoidable flight or car trip."),
        Resources(title: "Attend a rally.", description: "\u{2022} Recent climate strikes have shown that we have the people power we need to solve the climate crisis and end the age of fossil fuels.")
        ]
    
    let url = URL(string: "https://globalclimatestrike.net/more/")
//    UIApplication.shared.open(url)
    
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
        resourceView.tableView.backgroundColor = .clear
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
            return 65
        }
        
        if selectedIndex == indexPath {
            return 230
        }
        return 65
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
