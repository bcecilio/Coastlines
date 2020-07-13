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
    
    private var resources = Resource.getResources()
    
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
        
        print("last: \(lastCell.frame.height)")
        
        print("current: \(cell.frame.height)")
        
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
