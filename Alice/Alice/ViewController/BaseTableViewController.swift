//
//  BaseTableViewController.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController
{
    func registerNib(identifier : String)
    {
        let nib = UINib(nibName: identifier + "TableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: identifier + "Identifier")
    }
}