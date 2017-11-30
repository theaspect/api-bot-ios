//
//  String+AddBoundary.swift
//  capp
//
//  Created by Anton Skorodumov on 09.11.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension String {
    
    func addBoundary(_ boundary: String) -> String {
        return self + "; boundary=\(boundary)"
    }
    
}
