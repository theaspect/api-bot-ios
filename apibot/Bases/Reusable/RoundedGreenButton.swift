//
//  RoundedGreenButton.swift
//  vc
//
//  Created by Anton Skorodumov on 17.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class RoundedGreenButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.green
        makeRoundByMinSide()
    }
    
}
