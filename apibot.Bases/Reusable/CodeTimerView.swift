//
//  CodeTimerView.swift
//  safesensor
//
//  Created by Максим Ермолаев on 11.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

protocol CodeTimerDelegate {
    
    /**
     @author Maxim Ermolaev
     Время действия кода истекло
     */
    func onTimerEnd()
}

class CodeTimerView: BaseView {
    
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var lblTimer: UILabel!
    
    var timer: Timer?
    var currentMinutes: Float = 0
    var delegate: CodeTimerDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup("CodeTimerView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup("CodeTimerView")
    }
    
    override func nibSetup(_ nibName: String) {
        super.nibSetup(nibName)
    }
    
    func onTimerTick() {
        
        timerBar.progress = timerBar.progress - (1/60)
        lblTimer.text = "Код будет действителен еще \(Int(currentMinutes)) секунд"

        if (currentMinutes == 0) {
//            delegate.onTimeEnd()
            timer?.invalidate()
            return
        }
        currentMinutes -= 1
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func start() {
        stop()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(onTimerTick),
                                     userInfo: nil,
                                     repeats: true)
        currentMinutes = 60
        timerBar.progress = 1
        timer?.fire()
    }
}
