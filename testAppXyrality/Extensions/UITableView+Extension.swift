//
//  UITableView+Extension.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 23.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    // DESC: cls name should match with cell identifier
    func registerCell<T: UITableViewCell>(_ cls: T.Type) {
        let name = String(describing: cls.self)
        let cell = UINib.init(nibName: name, bundle: nil)
        self.register(cell, forCellReuseIdentifier: name)
    }
    
    func dequeueCell<T>(cls: T.Type, indexPath path: IndexPath) -> T? {
        let clsString = String(describing: T.self)
        return self.dequeueReusableCell(withIdentifier: clsString, for: path) as? T
    }
}
