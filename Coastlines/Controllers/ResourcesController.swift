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
        Resources(title: "Action 1", description: "bluhbluhbluh"),
        Resources(title: "Action 2", description: "bluhbluhbluh"),
        Resources(title: "Action 3", description: "bluhbluhbluh"),
        Resources(title: "Action 4", description: "bluhbluhbluh"),
        ]
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cells else {
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
            return 200
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
