//
//  WorldsViewController.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 23.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import UIKit

class WorldsViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    open var worlds = [World]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(WorldTableViewCell.self)
    }
}

// MARK: - UITableViewDataSource
extension WorldsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worlds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueCell(cls: WorldTableViewCell.self, indexPath: indexPath) {
            cell.cellSource(worlds[indexPath.row])
            cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.lightGray : UIColor.clear
            return cell
        }
        return UITableViewCell()
    }
}
