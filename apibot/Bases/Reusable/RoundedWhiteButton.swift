//
//  RoundedOrangeButton.swift
//  vc
//
//  Created by Андрей Гутов on 29.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

class RoundedWhiteButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        makeRoundByMinSide()
    }
    
}
