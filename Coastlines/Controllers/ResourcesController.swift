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
    
    private var resources = [
        Resources(title: "Bike to Work!", description: "\u{2022} To help, we've rounded up our best tips for eco-friendly commuting, starting a carpool, commuting by bike, and much more in this guide. You'll save money, time, and reduce your carbon footprint -- and could even lose weight!"),
        Resources(title: "Daily Actions You Can Take.", description: "\u{2022} The number one goal? Limiting the use of fossil fuels such as oil, carbon and natural gas and replacing them with renewable and cleaner sources of energy. This includes driving and flying less, switching to a ‘green’ energy provider."),
        Resources(title: "Considering Solar Energy.", description: "bluhbluhbluh"),
        Resources(title: "Can my diet make a difference?", description: "\u{2022} After fossil fuels, the food industry is one of the most important contributors to climate change. By reducing your consumption of animal protein by half you will cut your diet's carbon footprint by more than 40%."),
        Resources(title: "Can't afford to cut down?", description: "bluhbluhbluh"),
        ]
    
    private var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    override func loadView() {
        view = resourceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        resourceView.tableView.dataSource = self
        resourceView.tableView.delegate = self
        resourceView.tableView.register(ResourceCell.self, forCellReuseIdentifier: "cell")
        resourceView.tableView.separatorStyle = .none
    }
}

extension ResourcesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ResourceCell else {
            fatalError("it no dequeue bro")
        }
        let data = resources[indexPath.row]
        cell.configureCell(with: data)
        cell.selectionStyle = .none
        cell.animate()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIndex == indexPath {
            return 220
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
}
