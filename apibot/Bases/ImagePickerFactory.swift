//
//  ImagePickerFactory.swift
//  safesensor
//
//  Created by Anton Skorodumov on 22.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit
import Foundation

protocol ImagePickerFactory {
    
    func controller() -> UIImagePickerController
    
}

class ImagePickerFactoryImpl: ImagePickerFactory {
    
    func controller() -> UIImagePickerController {
        return UIImagePickerController()
    }
    
}
