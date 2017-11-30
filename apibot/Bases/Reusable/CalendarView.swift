//
//  CalendarView.swift
//  safesensor
//
//  Created by Максим Ермолаев on 23.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

protocol CalendarViewDelegate {
    
    func dateSelected(date: Date)
}

class CalendarView: BaseView {

    var delegate: CalendarViewDelegate!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup("CalendarView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup("CalendarView")
    }
    
    override func nibSetup(_ nibName: String) {
        super.nibSetup(nibName)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        delegate.dateSelected(date: datePicker.date)
    }
}
