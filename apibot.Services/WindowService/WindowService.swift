//
//  IWindowService.swift
//  SpeechKitExample
//
//  Created by Anton Skorodumov on 17.09.16.
//  Copyright © 2016 chameleon. All rights reserved.
//

import UIKit

protocol WindowService: class {
    
    /** @author Skorodumov Anton
     Установить рут контроллер для window
     */
    func setRootViewController(_ controller: UIViewController?)
    
    /** @author Skorodumov Anton
     Сделать видимым
     */
    func makeVisible()
    
    /** @author Skorodumov Anton
     Сделать невидимым
     */
    func makeInvisible()
    
    /** @author Skorodumov Anton
     Запушить вью контроллер в верхний, видимый navigationController
     */
    func pushViewController(controller: UIViewController?)
    
    /** @author Skorodumov Anton
     сделать present контроллера
     */
    func presentViewController(controller: UIViewController?)

    func addPopover(to alertController: UIAlertController?)
    
}
