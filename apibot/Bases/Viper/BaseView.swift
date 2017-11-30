//
//  BaseView.swift
//  capp
//
//  Created by Андрей Гутов on 18.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    public var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func nibSetup(_ nibName: String) {
        backgroundColor = .clear
        
        view = loadViewFromNib(nibName)
        addSubview(view)
        view.makeViewLeadingForTheView(leadingView: self)
    }
    
    fileprivate func loadViewFromNib(_ nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func setFrame(frame: CGRect) {
        view.frame = frame
    }
    
}
