//
//  BaseTablewViewCell.swift
//  capp
//
//  Created by Андрей Гутов on 17.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
 
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
