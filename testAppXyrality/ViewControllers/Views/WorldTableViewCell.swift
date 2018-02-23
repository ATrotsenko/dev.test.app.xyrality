//
//  WorldTableViewCell.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 23.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import UIKit

class WorldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func cellSource(_ world: World) {
        nameLabel.text = world.name + " " + world.worldStatus.description
    }
    
}
