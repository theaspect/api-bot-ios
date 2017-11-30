//
//  UITableView+RegisterNib.swift
//  vc
//
//  Created by Anton Skorodumov on 26.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

extension UITableView {

    func register(nib nibAndReuseIdentificator: String)
    {
        register(UINib(nibName: nibAndReuseIdentificator, bundle: nil), forCellReuseIdentifier: nibAndReuseIdentificator)
    }
    
}
