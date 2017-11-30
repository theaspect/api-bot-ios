//
//  UICollectionView+RegisterNib.swift
//  capp
//
//  Created by Anton Skorodumov on 30.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView
{
    func register(nib nibAndReuseIdentificator: String)
    {
        register(UINib(nibName: nibAndReuseIdentificator, bundle: nil),
                    forCellWithReuseIdentifier: nibAndReuseIdentificator)
    }
}
