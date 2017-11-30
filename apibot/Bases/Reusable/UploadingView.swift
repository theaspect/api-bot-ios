//
//  NotRecomendToast.swift
//  bolshoe
//
//  Created by Pavel Fokin on 28.03.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit


class UploadingView: BaseView
{
    
    let background: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    // MARK: - outlets
    
    @IBOutlet weak var pbProgress: UIProgressView!
    @IBOutlet weak var vwLoading: UIView!
    @IBOutlet weak var lblLoading: UILabel!
    
    // MARK: - initial

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup("UploadingView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup("UploadingView")
    }
    
    override func nibSetup(_ nibName: String) {
        super.nibSetup(nibName)
        pbProgress.progress = 0
        view.backgroundColor = background
        lblLoading.text = loc("LOADING_IN_PROGRESS")
        vwLoading.makeRoundWithRadius(radius: 10.0)
    }
    
    func setProgress(with currentValue: Float,
                     endValue: Float) {
        pbProgress.progress = currentValue / endValue
    }
    
}
