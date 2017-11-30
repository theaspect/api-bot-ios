//
//  File.swift
//  safesensor
//
//  Created by Anton Skorodumov on 09.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class DeviceSearchBlockView: BaseView {

    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    @IBOutlet weak var lblFindText: UILabel!
    @IBOutlet weak var vwActivityBounds: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup("DeviceSearchBlockView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup("DeviceSearchBlockView")
    }
    
    override func nibSetup(_ nibName: String) {
        super.nibSetup(nibName)
        lblFindText.text = loc("CAMERA_FIND_DEVICE", fromTable: "AddCamera")
        backgroundColor = .clear
        vwActivityBounds.makeRoundWithRadius(radius: 5.0)
    }
    
    func startCheckDevice() {
        aiLoading.startAnimating()
    }
    
    func finishCheckDevice() {
        aiLoading.stopAnimating()
    }
    
}
