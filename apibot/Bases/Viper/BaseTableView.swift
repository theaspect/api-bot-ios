//
//  BaseTableView.swift
//  capp
//
//  Created by Андрей Гутов on 04.11.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//
import UIKit

import Foundation

class BaseTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        automaticDimension()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        automaticDimension()
    }
    
    fileprivate func automaticDimension() {
        self.estimatedRowHeight = 300.0
        self.rowHeight = UITableViewAutomaticDimension
    }
}
