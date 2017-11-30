//
//  NotRecomendToast.swift
//  bolshoe
//
//  Created by Pavel Fokin on 28.03.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit


class SnackToast: BaseView
{
    // MARK: - property

    fileprivate var hideTimer: Timer!
    fileprivate var userData: [String: AnyObject?]?
    
    internal var tapButtonAction: (([String: AnyObject?]?) -> Void)?
    internal var closeAction: (([String: AnyObject?]?) -> Void)?
    internal var title: String?
    internal var buttonTitle: String?
    internal var showInterval: TimeInterval!
    
    // MARK: - outlets

    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var lblText: UILabel!

    // MARK: - initial
    
    init(frame: CGRect,
         title: String?,
         buttonTitle: String?,
         interval: TimeInterval,
         userData: [String: AnyObject?]? = nil,
         tapButtonAction: (([String: AnyObject?]?) -> Void)? = nil,
         closeAction: (([String: AnyObject?]?) -> Void)? = nil)
    {
        super.init(frame: frame)
        self.userData = userData
        self.tapButtonAction = tapButtonAction
        self.closeAction = closeAction
        self.title = title
        self.buttonTitle = buttonTitle
        self.showInterval = interval
        nibSetup("SnackToast")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup("SnackToast")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup("SnackToast")
    }
    
    override func nibSetup(_ nibName: String) {
        super.nibSetup(nibName)
        lblText.text = title
        btnAction.setTitle(buttonTitle, for: .normal)
        hideTimer = Timer.scheduledTimer(timeInterval: showInterval,
                                         target: self,
                                         selector: #selector(confirmAction),
                                         userInfo: nil,
                                         repeats: false)
    }
    
    // MARK: - class functions

    func removeToast() {
        UIView.animate(withDuration: 0.25, animations:
        { [weak self] in
            self?.view.alpha = 0.0
        }) { [weak self] (result) in
            self?.removeFromSuperview()
        }
        hideTimer?.invalidate()
        hideTimer = nil
    }
    
    func confirmAction() {
        closeAction?(userData)
        removeToast()
    }
    
    @IBAction func onButtonOpen(_ sender: AnyObject) {
        tapButtonAction?(userData)
        removeToast()
    }
}
