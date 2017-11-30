//
//  BaseTableViewController.swift
//  vc
//
//  Created by Anton Skorodumov on 10.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: BaseViewController {
    
    // MARK: - private variables
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - view controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = UIColor.clear
    }
    
}
